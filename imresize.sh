# from http://linmin.me/post/90443244839/resize-imagenet-data-short-edge-to-256x256
# RESIZE IMAGENET DATA (SHORT EDGE TO 256X256)
ls *.tar | xargs -P3 -I{} sh -c "tar -xvf {} -C ../original/" | xargs -P4 -I{} sh -c 'convert ../original/{} -colorspace rgb -resize 256x256^ ../resize/{}'

# Crop the center 256x256
convert dragon.gif -resize 64x64^ -gravity center -extent 64x64 fill_crop_dragon.gif