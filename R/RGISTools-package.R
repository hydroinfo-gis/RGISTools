#' `RGISTools': Handling Multiplatform Satellite Images
#'
#' This package enables you downloading, customizing, and processing time series
#' of satellite images from Landsat, MODIS and Sentinel in a standardized way.
#' Some functions download and convert automatically the platform-specific file
#' formats into GTiff, so they can be loaded in `R'. The customization functions 
#' support tile mosaicking, cropping, and deriving new variables of interest,
#' such as the normalized difference vegetation index (NDVI), enhanced 
#' vegetation index (EVI), etc. Tile mosaicking is required when the region of
#' interest extends over several tiles, so they can be combined into a single
#' image. Cropping involves removing the pixels outside the region of 
#' interest, making any analysis more computationally and memory efficient.
#' Processing involves cloud mosaicking, compositing and filling/smoothing
#' satellite data. Cloud masking eliminates the pixel values corresponding to
#' clouds. Cloud removal and (measurement or processing) errors trigger data
#' gaps and outliers, decreasing the quality and quantity of measurements. Hence,
#' the package includes a set of functions for filling and smoothing the
#' satellite imagery. The combination of functions in `RGISTools' results in a
#' stack of satellite images ready-to-use. Due to the wide variety of procedures
#' and sources of information being handled in `RGISTools', the functions are
#' divided into 7 categories, which are identified by the first 3 characters of
#' the function names; 
#' \enumerate{
#'   \item \code{mod} identifies MODIS Terra and Aqua satellite functions.
#'   \item \code{sen} identifies Sentinel functions.
#'   \item \code{ls7} identifies Landsat-7 functions.
#'   \item \code{ls8} identifies Landsat-8 functions.
#'   \item \code{ls} identifies both Landsat-7 and Landsat-8 functions.
#'   \item \code{gen} identifies function for being used in any of the three platforms.
#'   \item \code{var} identifies function for deriving variables in any of the three platforms.
#' }
#'
#' Below, there is a list of the most important functions grouped by satellite
#' programs, and listed in operational order. These functions include searching,
#' previewing, downloading, mosaicking, deriving new variables, compositing,
#' cloud masking and filling/smoothing satellite imagery.
#' 
#' @section I. Landsat functions:
#' The Landsat program is currently releasing imagery captured by two satellites;
#' the Landsat-7 and Lansat-8. The functions for both satellites are separate due
#' to discrepancies in their spectral coverage and data formats. To download
#' Landsat imagery with the following functions, a USGS's `EarthExplorer' account
#' is required. Please, register \href{https://ers.cr.usgs.gov/register/}{here}.
#' 
#' \subsection{Landsat-7}{
#' \tabular{ll}{
#'   \code{ \link{ls7LoadMetadata}}\tab Loads the Landsat-7 metadata file \cr
#'   \code{\link{ls7Search}} \tab Searches a time series of Landsat-7 images \cr
#'   \code{\link{lsPreview}} \tab Previews Landsat satellite images \cr
#'   \code{\link{lsDownload}} \tab Downloads a time series of Landsat images \cr
#'   \code{\link{lsCloudMask}} \tab Creates clouds masks for Landsat images \cr
#'   \code{\link{lsMosaic}} \tab Mosaics Landsat images \cr
#'   \code{\link{ls7FolderToVar}} \tab Computes new variables from Landsat-7 multispectral images \cr
#'   \code{\link{genSaveTSRData}} \tab Saves a time series of images \cr
#'   ----------------------\tab -------------------------------------------------------------------------------------------- \cr  
#'   }
#' }
#' \subsection{Landsat-8}{
#' \tabular{ll}{
#'   \code{ \link{ls8LoadMetadata}}\tab Loads the Landsat-8 metadata file \cr
#'   \code{\link{ls8Search}} \tab Searches a time series of Landsat-8 images \cr
#'   \code{\link{lsPreview}} \tab Previews Landsat satellite images \cr
#'   \code{\link{lsDownload}} \tab Downloads a time series of Landsat images\cr
#'   \code{\link{lsCloudMask}} \tab Creates cloud masks for Landsat images \cr
#'   \code{\link{lsMosaic}} \tab  Mosaics Landsat images \cr
#'   \code{\link{ls8FolderToVar}} \tab Computes new variables from Landsat-8 multispectral images \cr
#'   \code{\link{genSaveTSRData}} \tab Saves a time series of images \cr
#'   ----------------------\tab -------------------------------------------------------------------------------------------- \cr  
#'   }
#' }
#' 
#' @section II. MODIS functions:
#' Functions in `RGISTools' download all land products from Terra and Aqua 
#' satellites. However, the processing focuses on the multispectral images. Be
#' aware that an `EarthData' account is required to use NASA's web service so,
#' please, register \href{https://urs.earthdata.nasa.gov/users/new}{here}.
#' 
#' \tabular{ll}{
#'   \code{ \link{modSearch}} \tab Searches a time series of MODIS images \cr
#'   \code{\link{modPreview}} \tab Previews MODIS satellite images \cr
#'   \code{\link{modDownload}} \tab Downloads a time series of MODIS images \cr
#'   \code{\link{modMosaic}} \tab Mosaics MODIS images from the land products \cr
#'   \code{\link{modFolderToVar}} \tab Computes new variables from MODIS multispectral images \cr
#'   \code{\link{modCloudMask}} \tab Creates cloud masks for MODIS images \cr
#'   \code{\link{genSaveTSRData}} \tab Saves a time series of images \cr
#'   ----------------------\tab -------------------------------------------------------------------------------------------- \cr  
#'   }
#' 
#' @section III. Sentinel functions:
#' Sentinel archives provide a wide variety of products based on a 5-satellite
#' constellation. The functions to download Sentinel images can cope with any
#' product provided by ESA's `SciHub' web service. However, image processing is
#' focused on Sentinel-2 multispectal images. `SciHub' credentials are required
#' to download Sentinel imagery and can be obtained 
#' \href{https://scihub.copernicus.eu/dhus/#/self-registration}{here}.
#' 
#' \tabular{ll}{
#'   \code{ \link{senSearch}} \tab Searches a time series of Sentinel images \cr
#'   \code{\link{senPreview}} \tab Previews Sentinel images \cr
#'   \code{\link{senDownload}} \tab Downloads a time series of Sentinel images \cr
#'   \code{\link{senMosaic}} \tab Mosaics Sentinel-2 images \cr
#'   \code{\link{senCloudMask}} \tab Creates cloud masks for Sentinel-2 images \cr
#'   \code{\link{senFolderToVar}} \tab Computes new variables from Sentinel-2 multispectral images \cr
#'   \code{\link{genSaveTSRData}} \tab Saves a time series of images \cr
#'   ----------------------\tab -------------------------------------------------------------------------------------------- \cr  
#'   }
#' 
#' @section IV. Important general functions:
#' In addition to functions above, the package provides some general functions
#' for a better data handling and processing:
#' 
#' \tabular{ll}{
#'   \code{ \link{genCompositions}} \tab Creates compositions of images from a time series of satellite images \cr
#'   \code{\link{genSmoothingIMA}} \tab Fills the gaps and smooths outliers in a time series of satellite images \cr
#'   \code{\link{genSmoothingCovIMA}} \tab Fills the gaps and smooths outliers in a time series of satellite images using covariates \cr
#'   \code{\link{genPlotGIS}} \tab Plots satellite images with a proper GIS format \cr
#'   \code{\link{genGetDates}} \tab Gets the capturing date of an image from the name of a \code{RasterLayer} \cr
#'   ----------------------\tab -------------------------------------------------------------------------------------------- \cr  
#'   }
#' 
#' @section V. Remote sensing variables:
#' New variables can be derived from multispectral images. The most common
#' variables in the scientific literature are pre-programmed in `RGISTools'.
#' They can be identified by the prefix "var".
#' 
#' \tabular{ll}{
#'   \code{ \link{varEVI}}\tab Calculates the enhanced vegetation index (EVI) \cr
#'   \code{\link{varMSAVI2}} \tab Calculates the modified soil-adjusted vegetation index (MSAVI2) \cr
#'   \code{\link{varNBR}} \tab Calculates the normalized burn ratio (NBR) \cr
#'   \code{\link{varNBR2}} \tab Calculates the normalized burn ratio 2 (NBR2) \cr
#'   \code{\link{varNDMI}} \tab Calculates the normalized difference moisture index (NDMI) \cr
#'   \code{\link{varNDVI}} \tab Calculates the normalized difference vegetation index (NDVI) \cr
#'   \code{\link{varNDWI}} \tab  Calculates the normalized difference water index (NDWI) \cr
#'   \code{\link{varRGB}} \tab  Generates a Red-Green-Blue (RGB) image \cr
#'   \code{\link{varSAVI}} \tab  Calculates the soil-adjusted vegetation index (SAVI) \cr
#'   ----------------------\tab -------------------------------------------------------------------------------------------- \cr  
#'   }
#' 
#' @docType package
#' @name RGISTools-package
NULL