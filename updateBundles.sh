#!/bin/bash
# Run with ". ./updateBundles.sh"
current_dir=$PWD;
cd $current_dir;

# This repo
npm install

# Guitar-Centaur-RelatedPurchases-Service
cd $current_dir/services/Guitar-Centaur-Related-Purchases-Service
git pull origin jw-integration
npm install
sudo mariadb -u root < schema.sql
npm run seeder
npm run client
cd ../

# Guitar-Centaur-Carousel-Service
cd ./Guitar-Centaur-Carousel-Service
git pull origin jw-integration
npm install
sudo mariadb -u root < server/db/schema.sql
npm run seeder
npm run build
cd ../

# Guitar-Centaur-Add-to-Cart
cd ./Guitar-Centaur-Add-to-Cart
git pull origin jw-integration
npm install
sudo mariadb -u root < server/schema.sql
npm run seed
npm run build
cd ../

# Guitar-Centaur-Reviews-Service.git
cd ./Guitar-Centaur-Reviews-Service
git pull origin jw-integration
npm install
sudo mariadb -u root < server/db/schema.sql
npm run seeder
npm run build
cd ../

cd ../