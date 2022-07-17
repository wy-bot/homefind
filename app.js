import 'style-loader!css-loader!ol/ol.css';
import {Map,View} from 'ol';
import TileLayer from 'ol/layer/Tile';
import XYZ from 'ol/source/XYZ';
import WMTS from 'ol/source/WMTS';
import TileWMS from 'ol/source/TileWMS';
import WMTSTileGrid from 'ol/tilegrid/WMTS';
import {fromLonLat, get as getProjection, Projection} from 'ol/proj';
import {getTopLeft,getWidth} from 'ol/extent';
import Feature from 'ol/Feature';
import Point from 'ol/geom/Point';
import VectorSource from 'ol/source/Vector';
import VectorLayer from 'ol/layer/Vector';
import {Icon, Style} from 'ol/style';
import marker from './images/marker.png';
import VectorContext from 'ol/render/VectorContext';
import {Raster as RasterSource} from 'ol/source'
import ImageLayer from 'ol/layer/Image';


//xyz加载天地图
// const map_xyz = new Map({
//     target: "map",
//     layers:[
//         new TileLayer({
//             source: new XYZ({
//                 url: "http://t0.tianditu.com/DataServer?T=vec_w&x={x}&y={y}&l={z}&tk=1b5c70b0b006efdd020b4e374c73b1b9"
//             })
//         }),
//         new TileLayer({
//             source: new XYZ({
//                 url: "http://t0.tianditu.com/DataServer?T=cva_w&x={x}&y={y}&l={z}&tk=1b5c70b0b006efdd020b4e374c73b1b9"
//             })
//         })
//     ],
//     view: new View({
//         center: [0,0],
//         zoom: 2
//     })
// })

//wmts加载天地图
const projection = getProjection("EPSG:3857");
const projectionExtent = projection.getExtent();
const size = getWidth(projectionExtent)/256;
const resolutions = new Array(19);
const matrixIds = new Array(19);
for (let z=0;z<=19;++z){
    resolutions[z] = size / Math.pow(2,z);
    matrixIds[z] = z
}



// var json_all = []
// for (var i= 0;i<json.data.length;i++){
//     if (json.data[i].dangerLevel == 2){
//         var json_all_1 = json.data[i]
//         json_all_1 = json_all_1.dangerPros
        
//         for (var j = 0;j<json_all_1.length;j++){
//             if (json_all_1[j].provinceShortName == "江苏"){
//                 json_all_1 = json_all_1[j]
//                 json_all_1 = json_all_1.dangerAreas
                
//                 for (var k =0;k<json_all_1.length;k++){
//                     if (json_all_1[k].cityName == "苏州"){
//                         // json_all_1 = json_all_1[k]
//                         json_all.push(json_all_1[k])
//                     }
                        
//                 }
//             }
//         }
//     }
// }
// var json_all_xy = json_all[0]

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
//     geometry: new Point(fromLonLat([120.62,31.31]))
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

let layerOrigin = new TileLayer({
    name: "天地图矢量图层",
    source: new XYZ({
    url: "http://t0.tianditu.gov.cn/DataServer?T=vec_w&x={x}&y={y}&l={z}&tk=1b5c70b0b006efdd020b4e374c73b1b9",
    wrapX: true,
    crossOrigin: 'anonymous'
    })
    });

let layercvaOrigin = new TileLayer({
    name: "天地图矢量图层",
    source: new XYZ({
    url: "http://t0.tianditu.gov.cn/DataServer?T=cva_w&x={x}&y={y}&l={z}&tk=1b5c70b0b006efdd020b4e374c73b1b9",
    wrapX: false,
    crossOrigin: 'anonymous'
    })
    });

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


let home_point = new TileLayer({
    opacity: 0.7,
    source: new TileWMS({
        attributions:
          'Tiles © <a href="https://mrdata.usgs.gov/geology/state/"' +
          ' target="_blank">USGS</a>',
        url: "http://localhost:8888/geoserver/home/wms",
        params: {
            LAYERS: 'home:transform'
        },
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

let darklayer = new ImageLayer({
    name:'ssss',
    source:raster,
})
//创建新图层，注意，必须使用 ImageLayer

let map_wmts = new Map({
    target: "map",
    layers:[
        darklayer,
        layercvaOrigin,
        home_point
    ],
    view: new View({
        projection: projection,
        center: fromLonLat([105, 37]),
        zoom: 5
    })
})

// map_wmts.addLayer(layertianditu)


// var marker = require('./images/marker.png')



const iconStyle = new Style({
    image: new Icon({
        anchor: [0.5, 46],
        anchorXUnits: "fraction",
        anchorYUnits: "pixels",
        color: '#ffffff',
        src: marker
    }),
})

var feature = new Feature({
    geometry: new Point(fromLonLat([113.457278740096,34.6734005]))
        // img: new Icon({
        //     anchor: [0.5, 46],
        //     src: 'https://images.xiaozhuanlan.com/photo/2020/af4d72639f0ff7e0599c9d3935b123af.png'
        // })
})
feature.setStyle(iconStyle)
var source = new VectorSource({
    features: [feature]
})
    
var layer = new VectorLayer({
    source: source
})
// map_wmts.addLayer(layer)
// map_wmts.addLayer(home_point)