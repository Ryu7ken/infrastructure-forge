from flask import Flask, request, jsonify
import json
import uuid
import re

app = Flask(__name__)

'''We will mock having a state or database for this development server
by setting a global variable. You would never use a global variable
in a production server'''
home = {}

# This is a Python class that includes validation from ActiveRecord.
# This will represent our Home resource as a Python object

class Home:
    # Create some virtual attributes to store on this object.
    # This will set a getter and a setter.

    def __init__(self, town, name, description, domain_name, content_version):
        self.town = town
        self.name = name
        self.description = description
        self.domain_name = domain_name
        self.content_version = content_version

    def validate(self):
        errors = {}
        if self.town not in ['melomaniac-mansion', 'cooker-cove', 'video-valley', 'the-nomad-pad', 'gamers-grotto']:
            errors['town'] = 'Invalid town'
        # Visible to all user
        if not self.name:
            errors['name'] = "Name can't be blank"
        # Visible to all user
        if not self.description:
            errors['description'] = "Description can't be blank"
        # We want to lock this down to only be from CloudFront 
        if not re.match(r'.*\.cloudfront\.net$', self.domain_name):
            errors['domain_name'] = 'Domain must be from .cloudfront.net'
        # Content version has to be an integer 
        # We will make sure it is an incremental version in the controller
        if not isinstance(self.content_version, int):
            errors['content_version'] = 'Content version must be an integer'
        return errors

# Helper functions
def error(code, message):
    return jsonify({'err': message}), code

def ensure_correct_headings():
    if request.headers.get('Content-Type') != 'application/json':
        return error(415, 'Expected Content-Type header to be application/json')
    if request.headers.get('Accept') != 'application/json':
        return error(406, 'Expected Accept header to be application/json')
    return None

# Return a hardcoded access token
def x_access_code():
    return '9b49b3fb-b8e9-483c-b703-97ba88eef8e0'

def x_user_uuid():
    return 'e328f4ab-b99f-421c-84c9-4ccea042c7d1'

def find_user_by_bearer_token(user_uuid):
    auth_header = request.headers.get('Authorization')
    # Check if the Authorization header exists
    if not auth_header or not auth_header.startswith('Bearer '):
        return error(401, 'a1000 Failed to authenticate, bearer token invalid and/or teacherseat_user_uuid invalid')
    
    # Does the token match the one in our Database
    # code = access_code = token
    code = auth_header.split('Bearer ')[1]
    if code != x_access_code():
        return error(401, 'a1001 Failed to authenticate, bearer token invalid and/or teacherseat_user_uuid invalid')

    # The code and the user_uuid should be matching for user
    if user_uuid != x_user_uuid():
        return error(401, 'a1003 Failed to authenticate, bearer token invalid and/or teacherseat_user_uuid invalid')
    
    return None

# Routes
@app.route('/api/u/<user_uuid>/homes', methods=['POST'])
def create_home(user_uuid):
    headings_error = ensure_correct_headings()
    if headings_error:
        return headings_error
    
    auth_error = find_user_by_bearer_token(user_uuid)
    if auth_error:
        return auth_error

    try:
        print(f"Raw request data: {request.data}")
        payload = request.get_json()
    except Exception as e:
        print(f"Error parsing JSON: {e}")
        return error(422, 'Malformed JSON')

    name = payload.get('name')
    description = payload.get('description')
    domain_name = payload.get('domain_name')
    content_version = payload.get('content_version')
    town = payload.get('town')

    home_obj = Home(town, name, description, domain_name, content_version)
    validation_errors = home_obj.validate()
    if validation_errors:
        return jsonify(validation_errors), 422

    global home
    new_uuid = str(uuid.uuid4())
    home = {
        'uuid': new_uuid,
        'name': name,
        'town': town,
        'description': description,
        'domain_name': domain_name,
        'content_version': content_version
    }

    return jsonify({'uuid': new_uuid})

@app.route('/api/u/<user_uuid>/homes/<home_uuid>', methods=['GET'])
def read_home(user_uuid, home_uuid):
    headings_error = ensure_correct_headings()
    if headings_error:
        return headings_error
    
    auth_error = find_user_by_bearer_token(user_uuid)
    if auth_error:
        return auth_error

    if home_uuid == home.get('uuid'):
        return jsonify(home)
    else:
        return error(404, 'Failed to find home with provided uuid and bearer token')

@app.route('/api/u/<user_uuid>/homes/<home_uuid>', methods=['PUT'])
def update_home(user_uuid, home_uuid):
    headings_error = ensure_correct_headings()
    if headings_error:
        return headings_error
    
    auth_error = find_user_by_bearer_token(user_uuid)
    if auth_error:
        return auth_error

    if home_uuid != home.get('uuid'):
        return error(404, 'Failed to find home with provided uuid and bearer token')

    try:
        payload = request.get_json()
    except Exception:
        return error(422, 'Malformed JSON')

    name = payload.get('name')
    description = payload.get('description')
    content_version = payload.get('content_version')

    home_obj = Home(home['town'], name, description, home['domain_name'], content_version)
    validation_errors = home_obj.validate()
    if validation_errors:
        return jsonify(validation_errors), 422
    
    home['name'] = name
    home['description'] = description
    home['content_version'] = content_version

    return jsonify({'uuid': home_uuid})

@app.route('/api/u/<user_uuid>/homes/<home_uuid>', methods=['DELETE'])
def delete_home(user_uuid, home_uuid):
    headings_error = ensure_correct_headings()
    if headings_error:
        return headings_error
    
    auth_error = find_user_by_bearer_token(user_uuid)
    if auth_error:
        return auth_error

    global home
    if home_uuid != home.get('uuid'):
        return error(404, 'Failed to find home with provided uuid and bearer token')

    deleted_uuid = home['uuid']
    home = {}
    return jsonify({'uuid': deleted_uuid})

if __name__ == '__main__':
    app.run(debug=True)
