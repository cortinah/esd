\name{combine}
\alias{combine}
\alias{combine.default}
\alias{combine.stations}
\alias{combine.zoo}
\alias{combine.ds}
\alias{combine.ds.comb}
\alias{combine.ds.station}
\alias{combine.ds.station.eof}
\alias{combine.ds.station.field}
\alias{combine.station.month}
\alias{combine.ds.pca}
\alias{combine.list}
\alias{combine.station.eof}
\alias{zeros}
\alias{softattr}
\alias{g2dl}
\alias{g2dl.field}
\alias{g2dl.corfield}
\alias{g2dl.eof}
\alias{g2dl.default}
\alias{sp2np}
\title{Combine}
\description{\code{combine} is a S3 method for combinng esd objects,
  e.g. into groups of stations, stations and eof object, or fields. The
  function is based on \code{\link[zoo]{merge}}, and is also used to
  synchronise the esd objects.

  For fields, \code{combine.field} is used to append different data
  sets, e.g. for the purpose of computing common EOFs (seeo \code{\link{EOF}} or for mixing fields (coupled EOFs).

  For stations, \code{combine.station} can work tow ways: (1) to combine
  a set of stations and group them into one data object; (2) combine
  series with different monthly values for one specific site into one
  record for the monthly data. E.g. January, February, ..., December
  months can be combined into one complete series of monthly data.

  For DS-results, \code{combine.ds} is based on \code{combine.station},
  but also takes care of the additional meta data (the original series
  and predictor patterns). For instance, this method can combine
  seperate downscaled results for each calendar months at a single
  location into one complete time series.
  
  \code{g2dl} transform objects between grid starting at the grenwich
  (\code{greenwich=TRUE}) and the data line (\code{greenwich=FALSE}).

  \code{sp2np} re-arranges field objects accroding to a grid going from
  90S (South Pole) to 90N (Noth Pole) for \code{SP2NP=TRUE}. Otherwise,
  the object is arranged from 90N to 90S.

  \code{softattr} copies the names of a subset of the attributes
  excluding "index", "dim" and others specified by
  \code{ignore}. \code{attrcp} passes on the attributes from one object
  (x) to another (y). 
  
  \code{zeros} counts the occurrence of zero values in a vector.

  Other operations, such as \code{c(...)}, \code{rbind(...)} (combine
  along the time dimension), and \code{cbind(...)} (combine along the
  space dimension) also work.  
}
\usage{
attrcp(x,y,ignore=NULL)
combine(x,y,...)
combine.default(x,y,all=FALSE,orig.format=TRUE)
combine.ds(...,all=TRUE)
combine.ds.comb(...,all=TRUE) 
combine.ds.station(...,all=TRUE)
combine.ds.pca(...,all=TRUE)
combine.field(x,y,all=FALSE,dimension="time",approach="field",
              orig.format=TRUE,verbose=FALSE)
combine.field.station(x,y,all=FALSE,orig.format=TRUE,verbose=FALSE)
combine.list(...,all=TRUE)
combine.station(...,all=TRUE)
combine.station.month(...)
combine.station.eof(x,y,all=FALSE,orig.format=TRUE)
combine.station.field(x,y,all=FALSE,orig.format=TRUE)
combine.stations(...,all=TRUE)
combine.zoo(...)
g2dl(x,greenwich=TRUE,...)
g2dl.field(x,greenwich=TRUE)
g2dl.corfield(x,greenwich=TRUE)
g2dl.default(x,greenwich=TRUE,lon=NULL,lat=NULL,d=NULL)
g2dl.eof(x,greenwich=TRUE)
sp2np(x,SP2NP=TRUE)
softattr(x,ignore=NULL)
zeros(x)
}
\arguments{
\item{x}{station, eof, or field object}
\item{all}{See \code{link{merge.zoo}}}
\item{orig.format}{TRUE: the result will the formatted the same way as
  the input.}
\item{dimension}{Which dimension to combine - in time or in space}
\item{approach}{How to combine}
\item{greenwich}{TRUE: center map on the Greenwich line (0E)}
\item{SP2NP}{TRUE: order from south pole (bottom of plot) to north pole
  (top of plot)}
\item{ignore}{List of attributes to ignore.}
 }
\value{A field object}

\seealso{
}

\author{R.E. Benestad}
\examples{
t2m <- t2m.NCEP(lon=c(-40,40),lat=c(30,70))
T2m <- t2m.NorESM.M(lon=c(-40,40),lat=c(30,70))

# Combine in time to compute common EOFs:
X <- combine(t2m,T2m)
ceof <- EOF(X,it=1)
plot(ceof)

# Use combine to synchronise field and station data:
data(Oslo)
y <- combine.field.station(Oslo,t2m)
plot(y$y)
}
\keyword{utilities}
