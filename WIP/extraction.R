library(sf)
library(dplyr)
library(sprawl)
main_folder <- "/home/lb/my_data/prasia/Data"

in_shp <- read_vect(file.path(main_folder,
                              "vector/Ricetlas/riceatlas_asia_reshuffled.shp"))

Region_name <- "Region_3_-_Central_Luzon"

in_vect <- dplyr::filter(in_shp, Region == Region_name)

# Get the polygons of a specific region from the shapefile
in_vect <- in_vect[1:3] %>%
  sf::st_transform(get_proj4string(
    file.path(main_folder,"orig_mosaic/param_series/decirc/eos_decirc.tif"))) %>%
  unique()

plot_vect(in_vect, fill_var = "ID")

mosaic_folder  <- file.path(main_folder, "orig_mosaic/param_series/")
subsets_folder <- file.path(main_folder, "subsets")
make_folder(subsets_folder, type = "dirname", verbose = T)

pr_extract_subarea(mosaic_folder,
                   in_vect,
                   subset_name = Region_name,
                   out_folder  = subsets_folder)
in_files <- list.files(
  file.path(subsets_folder, Region_name, "param_series/decirc"),
  pattern= "*.RData",
  full.names = TRUE)

in_rast <- get(load(in_files[1]))
raster::NAvalue(in_rast) <- 0
out <- sprawl::extract_rast(in_rast,
                     in_vect,
                     join_geom = FALSE,
                     id_field = "ID")
