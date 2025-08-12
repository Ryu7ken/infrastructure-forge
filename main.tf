terraform {
  required_providers {
    terratowns = {
      source = "local.providers/local/terratowns"
      version = "1.0.0"
    }
  }

  cloud { 
    organization = "terraform_bootcamp_2025" 

    workspaces { 
      name = "terra-house" 
    } 
  }

}

provider "terratowns" {

  endpoint = var.terratowns_endpoint
  user_uuid = var.teacherseat_user_uuid
  token = var.terratowns_access_token
}

module "home_rollercoaster_hosting" {
  source = "./modules/terrahome"
  user_uuid = var.teacherseat_user_uuid
  public_filepath = var.rollercoaster.public_filepath
  content_version = var.rollercoaster.content_version
}

resource "terratowns_home" "home_rollercoaster" {
  name = "How to play Roller Coaster Tycoon in 2025!"
  description = <<DESCRIPTION
Roller Coaster Tycoon is a game from 1999 created by Chris Sawyer.
It is famous for run running on every Operating System
due to it being 99% written in x86 assembler/machine code (yes, really!), 
with a small amount of C code used to interface to MS Windows and DirectX.
People still love to play it despite its old looking graphics.
This is my guide that will show you how to play Roller Coaster Tycoon.
DESCRIPTION
  domain_name = module.home_rollercoaster_hosting.cloudfront_domain
  town = "gamers-grotto"
  content_version = var.rollercoaster.content_version
}

module "home_music_hosting" {
  source = "./modules/terrahome"
  user_uuid = var.teacherseat_user_uuid
  public_filepath = var.music.public_filepath
  content_version = var.music.content_version
}

resource "terratowns_home" "home_music" {
  name = "My Favorite Music Artists!"
  description = <<DESCRIPTION
I have been listening to American Music since 2008.
But around 2018 my taste in Music changed as I moved to towards
my non-lyric musics as I started to feel that lyrics is not so important
to make create a feeling in you but the Music's rythm and frequency is
enough to make you feel if can truly sync your mind with it.
So I wanted to share my current top 3 Music Artists.
DESCRIPTION
  domain_name = module.home_music_hosting.cloudfront_domain
  town = "melomaniac-mansion"
  content_version = var.music.content_version
}