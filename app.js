import 'style-loader!css-loader!ol/ol.css';
import {Map,View,Overlay} from 'ol';
import TileLayer from 'ol/layer/Tile';
import XYZ from 'ol/source/XYZ';
import WMTS from 'ol/source/WMTS';
import TileWMS from 'ol/source/TileWMS';
import WMTSTileGrid from 'ol/tilegrid/WMTS';
import {fromLonLat, get as getProjection, Projection} from 'ol/proj';
import {getTopLeft,getWidth,getCenter,boundingExtent} from 'ol/extent';
import Feature from 'ol/Feature';
import Point from 'ol/geom/Point';
import VectorSource from 'ol/source/Vector';
import VectorLayer from 'ol/layer/Vector';
import {Icon, Stroke, Style, Fill} from 'ol/style';
import marker from './images/marker.png';
import dataList from './data/center.json';
import VectorContext from 'ol/render/VectorContext';
import {Raster as RasterSource} from 'ol/source'
import ImageLayer from 'ol/layer/Image';
import WMSGetFeatureInfo from 'ol/format/WMSGetFeatureInfo';
import GeoJSON from 'ol/format/GeoJSON';
import {bbox as bboxStrategy} from 'ol/loadingstrategy';


//设置坐标系，范围
const projection = getProjection("EPSG:3857");
const projectionExtent = projection.getExtent();
const size = getWidth(projectionExtent)/256;
const resolutions = new Array(19);
const matrixIds = new Array(19);
for (let z=0;z<=19;++z){
    resolutions[z] = size / Math.pow(2,z);
    matrixIds[z] = z
}





//创建天地图图层（使用XYZ）
let layerOrigin = new TileLayer({
    name: "天地图矢量图层",
    source: new XYZ({
    url: "http://t0.tianditu.gov.cn/DataServer?T=vec_w&x={x}&y={y}&l={z}&tk=1b5c70b0b006efdd020b4e374c73b1b9",
    wrapX: true,
    crossOrigin: 'anonymous'
    })
    });
//创建天地图标注图层
let layercvaOrigin = new TileLayer({
    name: "天地图矢量图层",
    source: new XYZ({
    url: "http://t0.tianditu.gov.cn/DataServer?T=cva_w&x={x}&y={y}&l={z}&tk=1b5c70b0b006efdd020b4e374c73b1b9",
    wrapX: false,
    crossOrigin: 'anonymous'
    })
    });

//创建天地图图层（原始未变暗黑色，使用WMTS）
let layertianditu = new TileLayer({
    opacity: 0.7,
    source: new WMTS({
        attributions:
          'Tiles © <a href="https://mrdata.usgs.gov/geology/state/"' +
          ' target="_blank">USGS</a>',
        url: "http://t0.tianditu.gov.cn/vec_w/wmts?tk=1b5c70b0b006efdd020b4e374c73b1b9",
        layer: "vec",
        matrixSet: "w",
        format: "tiles",
        projection: projection,
        tileGrid: new WMTSTileGrid({
            origin: getTopLeft(projectionExtent),
            resolutions: resolutions,
            matrixIds: matrixIds
        }),
        style: "default",
        wrapX: true
    })
})

let wmsSource = new TileWMS({
    attributions:
      'Tiles © <a href="https://mrdata.usgs.gov/geology/state/"' +
      ' target="_blank">USGS</a>',
    url: "http://localhost:8888/geoserver/home/wms",
    params: {'LAYERS': 'home:china', 'TILED': true},
    serverType: 'geoserver',
    crossOrigin: 'anonymous',
    wrapX: true
})

//创建行政区划geoserver图层
let wmsLayer = new TileLayer({
    opacity: 0.7,
    source: wmsSource,
    minZoom: 3,
    maxZoom: 4.5
})

let wmsSource_province = new TileWMS({
    attributions:
      'Tiles © <a href="https://mrdata.usgs.gov/geology/state/"' +
      ' target="_blank">USGS</a>',
    url: "http://localhost:8888/geoserver/home/wms",
    params: {'LAYERS': 'home:province', 'TILED': true},
    serverType: 'geoserver',
    crossOrigin: 'anonymous',
    wrapX: true
})

//创建行政区划geoserver图层
let wmsLayer_province = new TileLayer({
    opacity: 0.7,
    source: wmsSource_province,
    minZoom: 4.5,
    maxZoom: 8
})

let wmsSource_city = new TileWMS({
    attributions:
      'Tiles © <a href="https://mrdata.usgs.gov/geology/state/"' +
      ' target="_blank">USGS</a>',
    url: "http://localhost:8888/geoserver/home/wms",
    params: {'LAYERS': 'home:city', 'TILED': true},
    serverType: 'geoserver',
    crossOrigin: 'anonymous',
    wrapX: true
})

//创建行政区划geoserver图层
let wmsLayer_city = new TileLayer({
    opacity: 0.7,
    source: wmsSource_city,
    minZoom: 8,
    maxZoom: 10
})

let wmsSource_region = new TileWMS({
    attributions:
      'Tiles © <a href="https://mrdata.usgs.gov/geology/state/"' +
      ' target="_blank">USGS</a>',
    url: "http://localhost:8888/geoserver/home/wms",
    params: {'LAYERS': 'home:region', 'TILED': true},
    serverType: 'geoserver',
    crossOrigin: 'anonymous',
    wrapX: true
})

//创建行政区划geoserver图层
let wmsLayer_region = new TileLayer({
    opacity: 0.7,
    source: wmsSource_region,
    minZoom: 10
})

//变色计算函数
let reverseFunc = function (pixelsTemp) {
    //蓝色
    for (var i = 0; i < pixelsTemp.length; i += 4) {
        var r = pixelsTemp[i];
        var g = pixelsTemp[i + 1];
        var b = pixelsTemp[i + 2];
        //运用图像学公式，设置灰度值
        var grey = r * 0.3 + g * 0.59 + b * 0.11;
        //将rgb的值替换为灰度值
        pixelsTemp[i] = grey;
        pixelsTemp[i + 1] = grey;
        pixelsTemp[i + 2] = grey;

        //基于灰色，设置为蓝色，这几个数值是我自己试出来的，可以根据需求调整
        pixelsTemp[i] = 55 - pixelsTemp[i];
        pixelsTemp[i + 1] = 255 - pixelsTemp[i + 1];
        pixelsTemp[i + 2] = 305 - pixelsTemp[i + 2];
    }
};

//创建变色source
const raster = new RasterSource({
    sources: [
        //传入图层，这里是天地图矢量图或者天地图矢量注记
        layerOrigin,
    ],
    //这里设置为image类型，与官方示例不同，优化速度
    operationType: 'image',
    operation: function (pixels, data) {
        //执行颜色转换方法，注意，这里的方法需要使用lib引入进来才可以使用
        reverseFunc(pixels[0].data)
        return pixels[0];
    },
    //线程数量
    threads: 10,
    //允许operation使用外部方法
    lib: {
        reverseFunc: reverseFunc,
    }
});

//创建新图层，注意，必须使用 ImageLayer
let darklayer = new ImageLayer({
    name:'ssss',
    source:raster,
})

let view = new View({
    projection: projection,
    center: fromLonLat([105, 37]),
    zoom: 4.3,
    minZoom: 4
})




//添加外部图标注
// var marker = require('./images/marker.png')
// const iconStyle = new Style({
//     image: new Icon({
//         anchor: [0.5, 46],
//         anchorXUnits: "fraction",
//         anchorYUnits: "pixels",
//         color: '#ffffff',
//         src: marker
//     }),
// })

// var feature = new Feature({
//     geometry: new Point(fromLonLat([113.457278740096,34.6734005]))
//         // img: new Icon({
//         //     anchor: [0.5, 46],
//         //     src: 'https://images.xiaozhuanlan.com/photo/2020/af4d72639f0ff7e0599c9d3935b123af.png'
//         // })
// })
// feature.setStyle(iconStyle)
// var source = new VectorSource({
//     features: [feature]
// })
    
// var layer = new VectorLayer({
//     source: source
// })
// map_wmts.addLayer(layer)
// map_wmts.addLayer(home_point)

//创建省市区矢量填充颜色style
const vectorFillStyle = new Style({
    fill: new Fill({
        color: '#e5b636',
        
    }),
    stroke: new Stroke({
        color: '#4577e7',
        width: 2
    })
})

//创建省市区标签style
const labelStyle = new Style({
    text: new Text({
      font: '12px Calibri,sans-serif',
      overflow: true,
      fill: new Fill({
        color: '#000',
      }),
      stroke: new Stroke({
        color: '#fff',
        width: 3,
      }),
    }),
})

const vectorStyle = [vectorFillStyle,labelStyle]
const vectorsource_province = new VectorSource({
    format: new GeoJSON(),
    url: function (extent) {
      return (
        'http://localhost:8888/geoserver/home/ows?service=WFS&' +
        'version=1.1.0&request=GetFeature&typename=home:province&' +
        'outputFormat=application/json&srsname=EPSG:3857&' +
        'bbox=' +
        extent.join(',') +
        ',EPSG:3857'
      );
    },
    strategy: bboxStrategy,
});
const vector_province = new VectorLayer({
    source: vectorsource_province,
    style: new Style({
        fill: new Fill({
            color: '#e5b636',
            
        }),
        stroke: new Stroke({
            color: '#4577e7',
            width: 2
        }),
        
    }),
    opacity: 0.7,
    minZoom: 4.5,
    maxZoom: 8
  });


const vector_city = new VectorLayer({
    source: new VectorSource({
        format: new GeoJSON(),
        url: function (extent) {
          return (
            'http://localhost:8888/geoserver/home/ows?service=WFS&' +
            'version=1.1.0&request=GetFeature&typename=home:city&' +
            'outputFormat=application/json&srsname=EPSG:3857&' +
            'bbox=' +
            extent.join(',') +
            ',EPSG:3857'
          );
        },
        strategy: bboxStrategy,
    }),
    style: new Style({
        fill: new Fill({
            color: '#e5b636',
            
        }),
        stroke: new Stroke({
            color: '#4577e7',
            width: 2
        }),
        
    }),
    opacity: 0.7,
    minZoom: 8,
    maxZoom: 10
});


const vector_region = new VectorLayer({
    source: new VectorSource({
        format: new GeoJSON(),
        url: function (extent) {
          return (
            'http://localhost:8888/geoserver/home/ows?service=WFS&' +
            'version=1.1.0&request=GetFeature&typename=home:region&' +
            'outputFormat=application/json&srsname=EPSG:3857&' +
            'bbox=' +
            extent.join(',') +
            ',EPSG:3857'
          );
        },
        strategy: bboxStrategy,
    }),
    style: new Style({
        fill: new Fill({
            color: '#e5b636',
            
        }),
        stroke: new Stroke({
            color: '#4577e7',
            width: 2
        }),
        
    }),
    opacity: 0.7,
    minZoom: 10,
    strategy: bboxStrategy,
});

//创建地图map，添加变色图层、标注图层、geoserver行政区划图层
let map_wmts = new Map({
    target: "map",
    layers:[
        darklayer,
        vector_province,
        vector_city,
        vector_region,
        // wmsLayer,
        // wmsLayer_province,
        // wmsLayer_city,
        // wmsLayer_region,
        layercvaOrigin
    ],
    view: view
})

// map_wmts.on('moveend',checkZoom)
// function checkZoom(){
//     const extent = view.calculateExtent(map_wmts.getSize())
//     var vector_region1 = null
//     if(view.getZoom()>10){
//         console.log(extent);
//         if(vector_region1 != null){
//             map_wmts.removeLayer(vector_region1)
//             vector_region1 = new VectorLayer({
//                 source: new VectorSource({
//                   url: 'http://localhost:8888/geoserver/home/ows?service=WFS&version=1.0.0&request=GetFeature&typeName=home%3Aregion&outputFormat=application%2Fjson',
//                   format: new GeoJSON(),
//                 }),
//                 style: new Style({
//                     fill: new Fill({
//                         color: '#e5b636',
                        
//                     }),
//                     stroke: new Stroke({
//                         color: '#4577e7',
//                         width: 2
//                     }),
                    
//                 }),
//                 opacity: 0.7,
//                 minZoom: 10,
//                 extent: extent
//             });
//             map_wmts.addLayer(vector_region1)
//             return vector_region1
//         }
//         vector_region1 = new VectorLayer({
//             source: new VectorSource({
//               url: 'http://localhost:8888/geoserver/home/ows?service=WFS&version=1.0.0&request=GetFeature&typeName=home%3Aregion&outputFormat=application%2Fjson',
//               format: new GeoJSON(),
//             }),
//             style: new Style({
//                 fill: new Fill({
//                     color: '#e5b636',
                    
//                 }),
//                 stroke: new Stroke({
//                     color: '#4577e7',
//                     width: 2
//                 }),
                
//             }),
//             opacity: 0.7,
//             minZoom: 10,
//             extent: extent
//         });
//         map_wmts.addLayer(vector_region1)
//         return vector_region1
//         // return vector_region
//     }
// }

//创建高亮style
const selectStyle = new Style({
    fill: new Fill({
        color: '#e5b636'
    }),
    stroke: new Stroke({
        color: '#4577e7',
        width: 1
    })
})

// //创建一个是否选择的变量
const status = document.getElementById('status');

let selected = null;
map_wmts.on('pointermove', function (e) {
  if (selected !== null) {
    selected.setStyle(undefined);
    selected = null;
  }

  map_wmts.forEachFeatureAtPixel(e.pixel, function (f) {
    selected = f;
    selectStyle.getFill().setColor(f.get('COLOR') || '#edcd75');
    f.setStyle(selectStyle);
    return true;
  });

  if (selected) {
    status.innerHTML = selected.get('name');
  } else {
    status.innerHTML = '&nbsp;';
  }

  const pixel = map_wmts.getEventPixel(e.originalEvent);
  const hit = map_wmts.hasFeatureAtPixel(pixel);
  map_wmts.getTargetElement().style.cursor = hit ? 'pointer' : '';
//   if(view.getZoom()>3&&view.getZoom()<=5){
//     if (e.dragging) {
//         return;
//       }
//     const data = wmsLayer.getData(e.pixel);
//     const hit = data && data[3] > 0; // transparent pixels have zero for data[3]
//     map_wmts.getTargetElement().style.cursor = hit ? 'pointer' : '';
//   }

//   if(view.getZoom()>5&&view.getZoom()<=8){
//     if (e.dragging) {
//         return;
//       }
//     const data = wmsLayer_province.getData(e.pixel);
//     const hit = data && data[3] > 0; // transparent pixels have zero for data[3]
//     map_wmts.getTargetElement().style.cursor = hit ? 'pointer' : '';
//   }

//   if(view.getZoom()>8&&view.getZoom()<=10){
//     if (e.dragging) {
//         return;
//       }
//     const data = wmsLayer_city.getData(e.pixel);
//     const hit = data && data[3] > 0; // transparent pixels have zero for data[3]
//     map_wmts.getTargetElement().style.cursor = hit ? 'pointer' : '';
//   }

//   if(view.getZoom()>10){
//     if (e.dragging) {
//         return;
//       }
//     const data = wmsLayer_region.getData(e.pixel);
//     const hit = data && data[3] > 0; // transparent pixels have zero for data[3]
//     map_wmts.getTargetElement().style.cursor = hit ? 'pointer' : '';
//   }
});

//   http://localhost:8888/geoserver/home/wms?SERVICE=WMS&VERSION=1.1.1&REQUEST=GetFeatureInfo&FORMAT=image%2Fpng&TRANSPARENT=true&QUERY_LAYERS=home%3Achina&LAYERS=home%3Achina&exceptions=application%2Fvnd.ogc.se_inimage&INFO_FORMAT=text%2Fhtml&FEATURE_COUNT=50&X=50&Y=50&SRS=EPSG%3A3857&STYLES=&WIDTH=101&HEIGHT=101&BBOX=9916650.025842065%2C1449333.7033324032%2C10903721.712607449%2C2436405.390097786
//   http://localhost:8888/geoserver/home/wms?SERVICE=WMS&VERSION=1.1.1&REQUEST=GetFeatureInfo&FORMAT=image%2Fpng&TRANSPARENT=true&QUERY_LAYERS=home%3Achina&LAYERS=home%3Achina&exceptions=application%2Fvnd.ogc.se_inimage&INFO_FORMAT=text%2Fhtml&FEATURE_COUNT=50&X=50&Y=50&SRS=EPSG%3A3857&STYLES=&WIDTH=101&HEIGHT=101&BBOX=10862675.047918046%2C2457906.2299157795%2C11849746.73468343%2C3444977.9166811625

//http://localhost:8888/geoserver/home/wms?SERVICE=WMS&VERSION=1.1.1&REQUEST=GetFeatureInfo&FORMAT=image%2Fpng&TRANSPARENT=true&QUERY_LAYERS=home%3Aregion&CODE_SH=540000&STYLES&LAYERS=home%3Aregion&exceptions=application%2Fvnd.ogc.se_inimage&INFO_FORMAT=text%2Fhtml&FEATURE_COUNT=50&X=50&Y=50&SRS=EPSG%3A3857&WIDTH=101&HEIGHT=101&BBOX=12944321.278423259%2C2270264.7602612223%2C13931392.965188643%2C3257336.4470266053
map_wmts.on('singleclick', function (evt) {
    document.getElementById('info').innerHTML = '';
    const viewResolution = /** @type {number} */ (view.getResolution());
    if(view.getZoom()>3&&view.getZoom()<=4.5){
        const url = wmsSource.getFeatureInfoUrl(
            evt.coordinate,
            viewResolution,
            'EPSG:3857',
            {'INFO_FORMAT': 'text/html'}
          );
          if (url) {
            fetch(url)
              .then((response) => response.text())
              .then((html) => {
                  document.getElementById('info').innerHTML = html;
                  
              });
          }
    }
    if(view.getZoom()>4.5&&view.getZoom()<=8){
        const url = wmsSource_province.getFeatureInfoUrl(
            evt.coordinate,
            viewResolution,
            'EPSG:3857',
            {'INFO_FORMAT': 'text/html'}
          );
          if (url) {
            fetch(url)
              .then((response) => response.text())
              .then((html) => {
                  document.getElementById('info').innerHTML = html;
                  
              });
          }
    }
    if(view.getZoom()>8&&view.getZoom()<=10){
        const url = wmsSource_city.getFeatureInfoUrl(
            evt.coordinate,
            viewResolution,
            'EPSG:3857',
            {'INFO_FORMAT': 'text/html'}
          );
          if (url) {
            fetch(url)
              .then((response) => response.text())
              .then((html) => {
                  document.getElementById('info').innerHTML = html;
                  
              });
          }
    }
    if(view.getZoom()>10){
        const url = wmsSource_region.getFeatureInfoUrl(
            evt.coordinate,
            viewResolution,
            'EPSG:3857',
            {'INFO_FORMAT': 'text/html'}
          );
          if (url) {
            fetch(url)
              .then((response) => response.text())
              .then((html) => {
                  document.getElementById('info').innerHTML = html;
                  
              });
          }
    }
  });

// map_wmts.on('pointermove', function (evt) {
//     if (evt.dragging) {
//       return;
//     }
//     const data = wmsLayer.getData(evt.pixel);
//     const hit = data && data[3] > 0; // transparent pixels have zero for data[3]
//     map_wmts.getTargetElement().style.cursor = hit ? 'pointer' : '';
// })


//标注
// var coordinate = evt.coordinate;        //鼠标单击的坐标
//     //新增div元素
//     var elementDiv = document.createElement('div');
//     var markerDiv = document.createElement('div');
//     markerDiv.className = 'marker';
//     elementDiv.appendChild(markerDiv);
//     var addressDiv = document.createElement('a');
//     addressDiv.className = 'address';
//     var labelText = null;
//     map_wmts.forEachFeatureAtPixel(evt.pixel, function (f) {
//         labelText = f;
//         return true;
//       });
    
//       if (labelText) {
//         addressDiv.innerText = selected.get('name');
//       } else {
//         addressDiv.innerText = '&nbsp;';
//       }
//     // addressDiv.innerText = '标注点';
//     elementDiv.appendChild(addressDiv);
//     var overLayElement = document.getElementById('overLay');
//     overLayElement.appendChild(elementDiv);
//     //实例化overlay标注，添加到地图容器中
//     var newOverlay = new Overlay({
//         position: coordinate,
//         positioning: 'center-center',
//         element: elementDiv,
//         // stopEvent: false
//     });

// map_wmts.on('click',function(evt){
//     var coordinate = evt.coordinate;        //鼠标单击的坐标
//     //新增div元素
//     var elementDiv = document.createElement('div');
//     var markerDiv = document.createElement('div');
//     markerDiv.className = 'marker';
//     elementDiv.appendChild(markerDiv);
//     var addressDiv = document.createElement('a');
//     addressDiv.className = 'address';
//     var labelText = null;
//     map_wmts.forEachFeatureAtPixel(evt.pixel, function (f) {
//         labelText = f;
//         return true;
//       });
    
//       if (labelText) {
//         addressDiv.innerText = selected.get('name');
//       } else {
//         addressDiv.innerText = '&nbsp;';
//       }
//     // addressDiv.innerText = '标注点';
//     elementDiv.appendChild(addressDiv);
//     var overLayElement = document.getElementById('overLay');
//     overLayElement.appendChild(elementDiv);
//     //实例化overlay标注，添加到地图容器中
//     var newOverlay = new Overlay({
//         position: labelText.center,
//         positioning: 'center-center',
//         element: elementDiv,
//         // stopEvent: false
//     });
//     map_wmts.addOverlay(newOverlay)
// })

// const centerpoint =new VectorSource({
//     format: new GeoJSON(),
//     url: function (extent) {
//       return (
//         'http://localhost:8888/geoserver/home/ows?service=WFS&' +
//         'version=1.1.0&request=GetFeature&typename=home:province&' +
//         'outputFormat=application/json&srsname=EPSG:3857&' +
//         'bbox=' +
//         extent.join(',') +
//         ',EPSG:3857'
//       );
//     },
//     strategy: bboxStrategy,
// })
// console.log(centerpoint);




vector_province.on('postrender',function(){
    if(view.getZoom()>4.5&&view.getZoom()<=8){
        
      const extentall = view.calculateExtent(map_wmts.getSize())
    
      // console.log(extentall);
      // const features = centerpoint
      // .getFeaturesInExtent(extentall)
      // .filter((feature) => feature.getGeometry().intersectsExtent(extentall))
      // console.log(features);
      const feature_province = vectorsource_province
      .getFeaturesInExtent(extentall)
      .filter((feature) => feature.getGeometry().intersectsExtent(extentall))
      var element_count = document.querySelectorAll('.element');
      var marker_count = document.querySelectorAll('.marker');
      
      if(element_count){
        
        map_wmts.getOverlays().clear()
        for(let i=0;i<feature_province.length;i++){
      
      
          var elementDiv = document.createElement('div');
          elementDiv.className = 'element';
          var markerDiv = document.createElement('div');
          markerDiv.className = 'marker';
          elementDiv.appendChild(markerDiv);
          var addressDiv = document.createElement('span');
          addressDiv.className = 'address';
          addressDiv.setAttribute('code',feature_province[i].get('adcode'));
          addressDiv.innerText = feature_province[i].get('name');
        
          // addressDiv.innerText = '标注点';
          elementDiv.appendChild(addressDiv);
          var overLayElement = document.getElementById('overLay');
          overLayElement.appendChild(elementDiv);
          
          let centerpoint = [0,0]
          for(let item of dataList){
            const pointx = `${item.pos.lng}`;
            const pointy = `${item.pos.lat}`;
            if(`${item.province}` == feature_province[i].get('name')){
                centerpoint[0] = pointx
                centerpoint[1] = pointy
                
            }
          }
          //实例化overlay标注，添加到地图容器中
          var newOverlay = new Overlay({
            position: centerpoint,
            positioning: 'center-center',
            element: elementDiv,
            // stopEvent: false
          });
        
          
          map_wmts.addOverlay(newOverlay)
        }
      }
    }

})
map_wmts.on('postrender',function(){
    if(view.getZoom()<4.5){
        map_wmts.getOverlays().clear()
    }
})

// var point = [13618024.112759456, 4748961.400167575]
// var feature = new Feature({
//   geometry:new Point(point)
// })
// var sourceVector1 = new VectorSource({
//   projection:projection,
//   features:[feature]
// })
// var vectorlayer1 = new VectorLayer({
//   source: sourceVector1
// })
// map_wmts.addLayer(vectorlayer1  )


// map_wmts.on('moveend',function(){
//     var elementDiv = document.createElement('div');
//     var markerDiv = document.createElement('div');
//     markerDiv.className = 'marker';
//     elementDiv.appendChild(markerDiv);
//     var addressDiv = document.createElement('a');
//     addressDiv.className = 'address';
    
//     addressDiv.innerText = feature_province[3].get('name');
//     console.log(feature_province[3]);  
//     // addressDiv.innerText = '标注点';
//     elementDiv.appendChild(addressDiv);
//     var overLayElement = document.getElementById('overLay');
//     overLayElement.appendChild(elementDiv);
//     //实例化overlay标注，添加到地图容器中
//     var newOverlay = new Overlay({
//         position: getCenter(feature_province[3].getGeometry().flatCoordinates),
//         positioning: 'center-center',
//         element: elementDiv,
//         // stopEvent: false
//     });
    
//     map_wmts.addOverlay(newOverlay)
// })