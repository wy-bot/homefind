/*
 Navicat Premium Data Transfer

 Source Server         : ceshi
 Source Server Type    : MySQL
 Source Server Version : 80022
 Source Host           : localhost:3306
 Source Schema         : aa

 Target Server Type    : MySQL
 Target Server Version : 80022
 File Encoding         : 65001

 Date: 22/07/2022 18:11:35
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for city
-- ----------------------------
DROP TABLE IF EXISTS `city`;
CREATE TABLE `city`  (
  `adcode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `code_sh` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name_sh` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Lon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Lat` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of city
-- ----------------------------
INSERT INTO `city` VALUES ('110000', '北京市', '110000', '北京市', '12959914.209491', '4893727.345515');
INSERT INTO `city` VALUES ('120000', '天津市', '120000', '天津市', '13063104.077979', '4762976.679753');
INSERT INTO `city` VALUES ('310000', '上海市', '310000', '上海市', '13523836.447187', '3660043.369487');
INSERT INTO `city` VALUES ('500000', '重庆市', '500000', '重庆市', '12009686.815432', '3512302.490208');
INSERT INTO `city` VALUES ('710000', '台湾省', '710000', '台湾省', '13466422.781303', '2722727.23981');
INSERT INTO `city` VALUES ('810000', '香港特别行政区', '810000', '香港特别行政区', '12705285.378723', '2556743.569888');
INSERT INTO `city` VALUES ('820000', '澳门特别行政区', '820000', '澳门特别行政区', '12642082.362364', '2531019.342438');
INSERT INTO `city` VALUES ('130100', '石家庄市', '130000', '河北省', '12739929.79709', '4598211.57531');
INSERT INTO `city` VALUES ('130200', '唐山市', '130000', '河北省', '13173264.975455', '4824336.431259');
INSERT INTO `city` VALUES ('130300', '秦皇岛市', '130000', '河北省', '13268516.18462', '4878796.297336');
INSERT INTO `city` VALUES ('130400', '邯郸市', '130000', '河北省', '12751478.16909', '4377082.903179');
INSERT INTO `city` VALUES ('130500', '邢台市', '130000', '河北省', '12781969.550577', '4468975.457501');
INSERT INTO `city` VALUES ('130600', '保定市', '130000', '河北省', '12821517.937845', '4725308.979047');
INSERT INTO `city` VALUES ('130700', '张家口市', '130000', '河北省', '12806036.921122', '4993875.076192');
INSERT INTO `city` VALUES ('130800', '承德市', '130000', '河北省', '13085745.666118', '5065024.468202');
INSERT INTO `city` VALUES ('130900', '沧州市', '130000', '河北省', '12998864.996443', '4617772.223234');
INSERT INTO `city` VALUES ('131000', '廊坊市', '130000', '河北省', '12983714.754813', '4759508.478652');
INSERT INTO `city` VALUES ('131100', '衡水市', '130000', '河北省', '12893961.818607', '4546233.351345');
INSERT INTO `city` VALUES ('140100', '太原市', '140000', '山西省', '12503661.861542', '4573825.309182');
INSERT INTO `city` VALUES ('140200', '大同市', '140000', '山西省', '12659797.385107', '4852086.347995');
INSERT INTO `city` VALUES ('140300', '阳泉市', '140000', '山西省', '12635401.969641', '4588529.698572');
INSERT INTO `city` VALUES ('140400', '长治市', '140000', '山西省', '12570335.914219', '4366602.163278');
INSERT INTO `city` VALUES ('140500', '晋城市', '140000', '山西省', '12547155.378452', '4247251.195523');
INSERT INTO `city` VALUES ('140600', '朔州市', '140000', '山西省', '12539928.778205', '4810783.263665');
INSERT INTO `city` VALUES ('140700', '晋中市', '140000', '山西省', '12575709.022879', '4485095.067867');
INSERT INTO `city` VALUES ('140800', '运城市', '140000', '山西省', '12364337.539583', '4189466.859927');
INSERT INTO `city` VALUES ('140900', '忻州市', '140000', '山西省', '12513984.461533', '4705186.214664');
INSERT INTO `city` VALUES ('141000', '临汾市', '140000', '山西省', '12398966.932942', '4332163.137667');
INSERT INTO `city` VALUES ('141100', '吕梁市', '140000', '山西省', '12386373.387114', '4534913.128219');
INSERT INTO `city` VALUES ('150100', '呼和浩特市', '150000', '内蒙古自治区', '12412523.48739', '4953030.380527');
INSERT INTO `city` VALUES ('150200', '包头市', '150000', '内蒙古自治区', '12274750.347604', '5095188.655268');
INSERT INTO `city` VALUES ('150300', '乌海市', '150000', '内蒙古自治区', '11897163.703847', '4783225.079076');
INSERT INTO `city` VALUES ('150400', '赤峰市', '150000', '内蒙古自治区', '13233487.804421', '5348460.297199');
INSERT INTO `city` VALUES ('150500', '通辽市', '150000', '内蒙古自治区', '13533057.152409', '5439864.528499');
INSERT INTO `city` VALUES ('150600', '鄂尔多斯市', '150000', '内蒙古自治区', '12093504.466089', '4782751.14622');
INSERT INTO `city` VALUES ('150700', '呼伦贝尔市', '150000', '内蒙古自治区', '13492761.854254', '6397218.634212');
INSERT INTO `city` VALUES ('150800', '巴彦淖尔市', '150000', '内蒙古自治区', '11975265.890329', '5079450.060764');
INSERT INTO `city` VALUES ('150900', '乌兰察布市', '150000', '内蒙古自治区', '12517032.206656', '5115722.075813');
INSERT INTO `city` VALUES ('152200', '兴安盟', '150000', '内蒙古自治区', '13507776.132813', '5819085.016748');
INSERT INTO `city` VALUES ('152500', '锡林郭勒盟', '150000', '内蒙古自治区', '12859264.468989', '5501562.580323');
INSERT INTO `city` VALUES ('152900', '阿拉善盟', '150000', '内蒙古自治区', '11401952.676955', '4943594.700124');
INSERT INTO `city` VALUES ('210100', '沈阳市', '210000', '辽宁省', '13708308.758566', '5176052.170603');
INSERT INTO `city` VALUES ('210200', '大连市', '210000', '辽宁省', '13603049.423551', '4806331.096261');
INSERT INTO `city` VALUES ('210300', '鞍山市', '210000', '辽宁省', '13694143.605973', '4970861.664331');
INSERT INTO `city` VALUES ('210400', '抚顺市', '210000', '辽宁省', '13877355.80561', '5136697.637704');
INSERT INTO `city` VALUES ('210500', '本溪市', '210000', '辽宁省', '13867524.006177', '5046540.408714');
INSERT INTO `city` VALUES ('210600', '丹东市', '210000', '辽宁省', '13848691.009004', '4945382.074289');
INSERT INTO `city` VALUES ('210700', '锦州市', '210000', '辽宁省', '13538519.580183', '5080695.697645');
INSERT INTO `city` VALUES ('210800', '营口市', '210000', '辽宁省', '13631756.965138', '4923043.833749');
INSERT INTO `city` VALUES ('210900', '阜新市', '210000', '辽宁省', '13576740.114921', '5203462.225064');
INSERT INTO `city` VALUES ('211000', '辽阳市', '210000', '辽宁省', '13720250.922805', '5039617.928435');
INSERT INTO `city` VALUES ('211100', '盘锦市', '210000', '辽宁省', '13580927.649465', '5022450.150497');
INSERT INTO `city` VALUES ('211200', '铁岭市', '210000', '辽宁省', '13823280.664804', '5258679.153499');
INSERT INTO `city` VALUES ('211300', '朝阳市', '210000', '辽宁省', '13360769.354675', '5088847.148268');
INSERT INTO `city` VALUES ('211400', '葫芦岛市', '210000', '辽宁省', '13381866.459211', '4956530.123431');
INSERT INTO `city` VALUES ('220100', '长春市', '220000', '吉林省', '13980978.869465', '5510544.108727');
INSERT INTO `city` VALUES ('220200', '吉林市', '220000', '吉林省', '14120880.946479', '5401931.284927');
INSERT INTO `city` VALUES ('220300', '四平市', '220000', '吉林省', '13846899.739975', '5386479.404114');
INSERT INTO `city` VALUES ('220400', '辽源市', '220000', '吉林省', '13949598.964061', '5283786.980723');
INSERT INTO `city` VALUES ('220500', '通化市', '220000', '吉林省', '14021291.560037', '5155640.832187');
INSERT INTO `city` VALUES ('220600', '白山市', '220000', '吉林省', '14169946.247334', '5172219.540905');
INSERT INTO `city` VALUES ('220700', '松原市', '220000', '吉林省', '13857755.224251', '5591251.294652');
INSERT INTO `city` VALUES ('220800', '白城市', '220000', '吉林省', '13694479.800128', '5677528.369948');
INSERT INTO `city` VALUES ('222400', '延边朝鲜族自治州', '220000', '吉林省', '14374780.37344', '5334963.013541');
INSERT INTO `city` VALUES ('230100', '哈尔滨市', '230000', '黑龙江省', '14245209.900636', '5724215.909441');
INSERT INTO `city` VALUES ('230200', '齐齐哈尔市', '230000', '黑龙江省', '13865761.866142', '6058920.584236');
INSERT INTO `city` VALUES ('230300', '鸡西市', '230000', '黑龙江省', '14727373.155675', '5722105.923923');
INSERT INTO `city` VALUES ('230400', '鹤岗市', '230000', '黑龙江省', '14561398.556379', '6047918.738785');
INSERT INTO `city` VALUES ('230500', '双鸭山市', '230000', '黑龙江省', '14763510.976527', '5896794.799604');
INSERT INTO `city` VALUES ('230600', '大庆市', '230000', '黑龙江省', '13882189.059412', '5837866.252745');
INSERT INTO `city` VALUES ('230700', '伊春市', '230000', '黑龙江省', '14385256.922656', '6078791.368658');
INSERT INTO `city` VALUES ('230800', '佳木斯市', '230000', '黑龙江省', '14716856.195739', '5982459.656939');
INSERT INTO `city` VALUES ('230900', '七台河市', '230000', '黑龙江省', '14576599.458654', '5761407.765043');
INSERT INTO `city` VALUES ('231000', '牡丹江市', '230000', '黑龙江省', '14459918.613383', '5559941.490244');
INSERT INTO `city` VALUES ('231100', '黑河市', '230000', '黑龙江省', '14136284.115745', '6322983.517842');
INSERT INTO `city` VALUES ('231200', '绥化市', '230000', '黑龙江省', '14099572.318153', '5926448.260864');
INSERT INTO `city` VALUES ('232700', '大兴安岭地区', '230000', '黑龙江省', '13825850.128427', '6855518.976471');
INSERT INTO `city` VALUES ('320100', '南京市', '320000', '江苏省', '13230092.297262', '3753841.718059');
INSERT INTO `city` VALUES ('320200', '无锡市', '320000', '江苏省', '13367327.828069', '3700817.302799');
INSERT INTO `city` VALUES ('320300', '徐州市', '320000', '江苏省', '13082435.436712', '4076642.733865');
INSERT INTO `city` VALUES ('320400', '常州市', '320000', '江苏省', '13318471.929324', '3714000.438808');
INSERT INTO `city` VALUES ('320500', '苏州市', '320000', '江苏省', '13431899.991885', '3682571.248476');
INSERT INTO `city` VALUES ('320600', '南通市', '320000', '江苏省', '13475011.023765', '3787274.702657');
INSERT INTO `city` VALUES ('320700', '连云港市', '320000', '江苏省', '13263138.131511', '4101000.643962');
INSERT INTO `city` VALUES ('320800', '淮安市', '320000', '江苏省', '13243794.924531', '3942166.111059');
INSERT INTO `city` VALUES ('320900', '盐城市', '320000', '江苏省', '13380462.139316', '3964060.006716');
INSERT INTO `city` VALUES ('321000', '扬州市', '320000', '江苏省', '13300425.967663', '3860467.693734');
INSERT INTO `city` VALUES ('321100', '镇江市', '320000', '江苏省', '13298024.628545', '3765149.687372');
INSERT INTO `city` VALUES ('321200', '泰州市', '320000', '江苏省', '13365102.305001', '3838567.587438');
INSERT INTO `city` VALUES ('321300', '宿迁市', '320000', '江苏省', '13194291.55537', '3999927.886177');
INSERT INTO `city` VALUES ('330100', '杭州市', '330000', '浙江省', '13300057.861662', '3490561.418519');
INSERT INTO `city` VALUES ('330200', '宁波市', '330000', '浙江省', '13523311.928201', '3468914.09874');
INSERT INTO `city` VALUES ('330300', '温州市', '330000', '浙江省', '13410512.691024', '3235675.29086');
INSERT INTO `city` VALUES ('330400', '嘉兴市', '330000', '浙江省', '13445545.333736', '3583514.632366');
INSERT INTO `city` VALUES ('330500', '湖州市', '330000', '浙江省', '13344275.767734', '3599423.241505');
INSERT INTO `city` VALUES ('330600', '绍兴市', '330000', '浙江省', '13429696.647838', '3469268.617038');
INSERT INTO `city` VALUES ('330700', '金华市', '330000', '浙江省', '13353548.103275', '3390311.366292');
INSERT INTO `city` VALUES ('330800', '衢州市', '330000', '浙江省', '13211360.166168', '3367040.752632');
INSERT INTO `city` VALUES ('330900', '舟山市', '330000', '浙江省', '13601335.551359', '3518250.646613');
INSERT INTO `city` VALUES ('331000', '台州市', '330000', '浙江省', '13485238.548931', '3344635.680219');
INSERT INTO `city` VALUES ('331100', '丽水市', '330000', '浙江省', '13304582.905234', '3273902.947028');
INSERT INTO `city` VALUES ('340100', '合肥市', '340000', '安徽省', '13064506.064343', '3732191.487524');
INSERT INTO `city` VALUES ('340200', '芜湖市', '340000', '安徽省', '13151281.207556', '3653671.864792');
INSERT INTO `city` VALUES ('340300', '蚌埠市', '340000', '安徽省', '13061137.972963', '3909633.745001');
INSERT INTO `city` VALUES ('340400', '淮南市', '340000', '安徽省', '12999148.76835', '3825395.889254');
INSERT INTO `city` VALUES ('340500', '马鞍山市', '340000', '安徽省', '13176955.378115', '3715752.63472');
INSERT INTO `city` VALUES ('340600', '淮北市', '340000', '安徽省', '12996394.208652', '3992275.061346');
INSERT INTO `city` VALUES ('340700', '铜陵市', '340000', '安徽省', '13086864.864009', '3617504.482059');
INSERT INTO `city` VALUES ('340800', '安庆市', '340000', '安徽省', '12967769.621419', '3577674.867951');
INSERT INTO `city` VALUES ('341000', '黄山市', '340000', '安徽省', '13144176.008006', '3491317.741239');
INSERT INTO `city` VALUES ('341100', '滁州市', '340000', '安徽省', '13147710.470421', '3834873.130744');
INSERT INTO `city` VALUES ('341200', '阜阳市', '340000', '安徽省', '12880655.758811', '3884249.156108');
INSERT INTO `city` VALUES ('341300', '宿州市', '340000', '安徽省', '13048201.986295', '4010053.200518');
INSERT INTO `city` VALUES ('341500', '六安市', '340000', '安徽省', '12939111.745405', '3718671.121753');
INSERT INTO `city` VALUES ('341600', '亳州市', '340000', '安徽省', '12933676.99651', '3953214.303579');
INSERT INTO `city` VALUES ('341700', '池州市', '340000', '安徽省', '13065586.250831', '3539869.367134');
INSERT INTO `city` VALUES ('341800', '宣城市', '340000', '安徽省', '13231154.409169', '3591914.278977');
INSERT INTO `city` VALUES ('350100', '福州市', '350000', '福建省', '13269895.503554', '3004852.787204');
INSERT INTO `city` VALUES ('350200', '厦门市', '350000', '福建省', '13149605.265263', '2833954.464614');
INSERT INTO `city` VALUES ('350300', '莆田市', '350000', '福建省', '13236408.609347', '2930042.766537');
INSERT INTO `city` VALUES ('350400', '三明市', '350000', '福建省', '13068897.163859', '3036048.960123');
INSERT INTO `city` VALUES ('350500', '泉州市', '350000', '福建省', '13165676.953847', '2899249.889757');
INSERT INTO `city` VALUES ('350600', '漳州市', '350000', '福建省', '13075436.096849', '2793769.383633');
INSERT INTO `city` VALUES ('350700', '南平市', '350000', '福建省', '13152077.694081', '3165830.963762');
INSERT INTO `city` VALUES ('350800', '龙岩市', '350000', '福建省', '12995872.791535', '2911611.432309');
INSERT INTO `city` VALUES ('350900', '宁德市', '350000', '福建省', '13302123.205069', '3119547.668489');
INSERT INTO `city` VALUES ('360100', '南昌市', '360000', '江西省', '12915687.618865', '3330839.088847');
INSERT INTO `city` VALUES ('360200', '景德镇市', '360000', '江西省', '13055028.150457', '3414673.357132');
INSERT INTO `city` VALUES ('360300', '萍乡市', '360000', '江西省', '12680199.518401', '3187331.501282');
INSERT INTO `city` VALUES ('360400', '九江市', '360000', '江西省', '12852741.553016', '3416489.256491');
INSERT INTO `city` VALUES ('360500', '新余市', '360000', '江西省', '12785844.73473', '3229106.330718');
INSERT INTO `city` VALUES ('360600', '鹰潭市', '360000', '江西省', '13036909.557793', '3276969.359433');
INSERT INTO `city` VALUES ('360700', '赣州市', '360000', '江西省', '12832821.617461', '2963210.460771');
INSERT INTO `city` VALUES ('360800', '吉安市', '360000', '江西省', '12782886.826712', '3120047.835935');
INSERT INTO `city` VALUES ('360900', '宜春市', '360000', '江西省', '12799294.983571', '3287433.302996');
INSERT INTO `city` VALUES ('361000', '抚州市', '360000', '江西省', '12961978.515694', '3187200.201011');
INSERT INTO `city` VALUES ('361100', '上饶市', '360000', '江西省', '13077410.092313', '3346742.349254');
INSERT INTO `city` VALUES ('370100', '济南市', '370000', '山东省', '13049009.489626', '4389034.54165');
INSERT INTO `city` VALUES ('370200', '青岛市', '370000', '山东省', '13375175.079347', '4362796.988237');
INSERT INTO `city` VALUES ('370300', '淄博市', '370000', '山东省', '13142234.190322', '4385022.171681');
INSERT INTO `city` VALUES ('370400', '枣庄市', '370000', '山东省', '13068704.387741', '4152504.463225');
INSERT INTO `city` VALUES ('370500', '东营市', '370000', '山东省', '13207066.817104', '4529023.652259');
INSERT INTO `city` VALUES ('370600', '烟台市', '370000', '山东省', '13447888.359416', '4473503.256943');
INSERT INTO `city` VALUES ('370700', '潍坊市', '370000', '山东省', '13255666.822262', '4377164.700056');
INSERT INTO `city` VALUES ('370800', '济宁市', '370000', '山东省', '12995533.842534', '4214426.348605');
INSERT INTO `city` VALUES ('370900', '泰安市', '370000', '山东省', '13027813.114349', '4300937.243468');
INSERT INTO `city` VALUES ('371000', '威海市', '370000', '山东省', '13581077.565705', '4455689.453129');
INSERT INTO `city` VALUES ('371100', '日照市', '370000', '山东省', '13263322.502813', '4242781.485738');
INSERT INTO `city` VALUES ('371300', '临沂市', '370000', '山东省', '13167581.122693', '4206325.815044');
INSERT INTO `city` VALUES ('371400', '德州市', '370000', '山东省', '12985875.874166', '4474210.88666');
INSERT INTO `city` VALUES ('371500', '聊城市', '370000', '山东省', '12900574.461786', '4364110.279776');
INSERT INTO `city` VALUES ('371600', '滨州市', '370000', '山东省', '13118713.536906', '4515024.810229');
INSERT INTO `city` VALUES ('371700', '菏泽市', '370000', '山东省', '12879477.111427', '4184588.178375');
INSERT INTO `city` VALUES ('410100', '郑州市', '410000', '河南省', '12632256.770407', '4113198.524481');
INSERT INTO `city` VALUES ('410200', '开封市', '410000', '河南省', '12750739.996874', '4110265.825484');
INSERT INTO `city` VALUES ('410300', '洛阳市', '410000', '河南省', '12472066.669474', '4068242.108378');
INSERT INTO `city` VALUES ('410400', '平顶山市', '410000', '河南省', '12580938.797519', '4001405.396509');
INSERT INTO `city` VALUES ('410500', '安阳市', '410000', '河南省', '12730294.657849', '4283905.814883');
INSERT INTO `city` VALUES ('410600', '鹤壁市', '410000', '河南省', '12725612.937634', '4262369.536285');
INSERT INTO `city` VALUES ('410700', '新乡市', '410000', '河南省', '12701021.118395', '4199815.99532');
INSERT INTO `city` VALUES ('410800', '焦作市', '410000', '河南省', '12594420.681097', '4179464.602424');
INSERT INTO `city` VALUES ('410900', '濮阳市', '410000', '河南省', '12833731.692068', '4274407.242163');
INSERT INTO `city` VALUES ('411000', '许昌市', '410000', '河南省', '12658777.624848', '4038398.323447');
INSERT INTO `city` VALUES ('411100', '漯河市', '410000', '河南省', '12679921.289177', '3982503.249941');
INSERT INTO `city` VALUES ('411200', '三门峡市', '410000', '河南省', '12368992.919546', '4077521.261391');
INSERT INTO `city` VALUES ('411300', '南阳市', '410000', '河南省', '12499870.33327', '3901251.083601');
INSERT INTO `city` VALUES ('411400', '商丘市', '410000', '河南省', '12879912.713419', '4067673.768998');
INSERT INTO `city` VALUES ('411500', '信阳市', '410000', '河南省', '12789366.457463', '3773887.71009');
INSERT INTO `city` VALUES ('411600', '周口市', '410000', '河南省', '12788744.163115', '3991515.81207');
INSERT INTO `city` VALUES ('411700', '驻马店市', '410000', '河南省', '12707835.785609', '3885057.834876');
INSERT INTO `city` VALUES ('419001', '济源市', '410000', '河南省', '12512149.094694', '4177342.413335');
INSERT INTO `city` VALUES ('420100', '武汉市', '420000', '湖北省', '12729232.580643', '3583915.06306');
INSERT INTO `city` VALUES ('420200', '黄石市', '420000', '湖北省', '12805062.53993', '3493963.881794');
INSERT INTO `city` VALUES ('420300', '十堰市', '420000', '湖北省', '12294917.925732', '3823535.095664');
INSERT INTO `city` VALUES ('420500', '宜昌市', '420000', '湖北省', '12372147.949198', '3599994.953396');
INSERT INTO `city` VALUES ('420600', '襄阳市', '420000', '湖北省', '12461414.891268', '3754297.178279');
INSERT INTO `city` VALUES ('420700', '鄂州市', '420000', '湖北省', '12774997.459455', '3545586.456901');
INSERT INTO `city` VALUES ('420800', '荆门市', '420000', '湖北省', '12536198.729514', '3641769.417198');
INSERT INTO `city` VALUES ('420900', '孝感市', '420000', '湖北省', '12677678.392976', '3648076.713149');
INSERT INTO `city` VALUES ('421000', '荆州市', '420000', '湖北省', '12531758.746564', '3502911.249187');
INSERT INTO `city` VALUES ('421100', '黄冈市', '420000', '湖北省', '12840007.107997', '3596106.317895');
INSERT INTO `city` VALUES ('421200', '咸宁市', '420000', '湖北省', '12710553.463355', '3455098.603848');
INSERT INTO `city` VALUES ('421300', '随州市', '420000', '湖北省', '12626969.528951', '3740772.704006');
INSERT INTO `city` VALUES ('422800', '恩施土家族苗族自治州', '420000', '湖北省', '12195620.942148', '3528236.544661');
INSERT INTO `city` VALUES ('429004', '仙桃市', '420000', '湖北省', '12621542.736954', '3540559.293569');
INSERT INTO `city` VALUES ('429005', '潜江市', '420000', '湖北省', '12552664.772013', '3546907.74881');
INSERT INTO `city` VALUES ('429006', '天门市', '420000', '湖北省', '12592170.056657', '3586484.252001');
INSERT INTO `city` VALUES ('429021', '神农架林区', '420000', '湖北省', '12298661.753122', '3709563.30465');
INSERT INTO `city` VALUES ('430100', '长沙市', '430000', '湖南省', '12596755.508213', '3277269.445105');
INSERT INTO `city` VALUES ('430200', '株洲市', '430000', '湖南省', '12637226.265858', '3138337.820122');
INSERT INTO `city` VALUES ('430300', '湘潭市', '430000', '湖南省', '12535532.932565', '3214786.340712');
INSERT INTO `city` VALUES ('430400', '衡阳市', '430000', '湖南省', '12532313.416816', '3097525.062218');
INSERT INTO `city` VALUES ('430500', '邵阳市', '430000', '湖南省', '12343189.19934', '3112495.339971');
INSERT INTO `city` VALUES ('430600', '岳阳市', '430000', '湖南省', '12607996.471575', '3383932.559323');
INSERT INTO `city` VALUES ('430700', '常德市', '430000', '湖南省', '12414873.613699', '3413867.145177');
INSERT INTO `city` VALUES ('430800', '张家界市', '430000', '湖南省', '12304312.017177', '3425416.58841');
INSERT INTO `city` VALUES ('430900', '益阳市', '430000', '湖南省', '12463116.684766', '3321510.897499');
INSERT INTO `city` VALUES ('431000', '郴州市', '430000', '湖南省', '12594921.380295', '2975949.342607');
INSERT INTO `city` VALUES ('431100', '永州市', '430000', '湖南省', '12438232.025748', '2971150.687966');
INSERT INTO `city` VALUES ('431200', '怀化市', '430000', '湖南省', '12254325.207014', '3192693.923806');
INSERT INTO `city` VALUES ('431300', '娄底市', '430000', '湖南省', '12425268.373355', '3215764.71951');
INSERT INTO `city` VALUES ('433100', '湘西土家族苗族自治州', '430000', '湖南省', '12215281.271398', '3336840.814301');
INSERT INTO `city` VALUES ('440100', '广州市', '440000', '广东省', '12639704.418927', '2671900.710552');
INSERT INTO `city` VALUES ('440200', '韶关市', '440000', '广东省', '12665846.092742', '2853584.311244');
INSERT INTO `city` VALUES ('440300', '深圳市', '440000', '广东省', '12706207.928466', '2588870.374455');
INSERT INTO `city` VALUES ('440400', '珠海市', '440000', '广东省', '12619533.03124', '2529607.018514');
INSERT INTO `city` VALUES ('440500', '汕头市', '440000', '广东省', '12979825.497493', '2671728.066741');
INSERT INTO `city` VALUES ('440600', '佛山市', '440000', '广东省', '12573527.524983', '2632557.650106');
INSERT INTO `city` VALUES ('440700', '江门市', '440000', '广东省', '12543252.051341', '2543486.409506');
INSERT INTO `city` VALUES ('440800', '湛江市', '440000', '广东省', '12263990.272577', '2400815.615676');
INSERT INTO `city` VALUES ('440900', '茂名市', '440000', '广东省', '12351861.74046', '2512562.754921');
INSERT INTO `city` VALUES ('441200', '肇庆市', '440000', '广东省', '12491195.792471', '2697023.078593');
INSERT INTO `city` VALUES ('441300', '惠州市', '440000', '广东省', '12746885.98236', '2660311.72941');
INSERT INTO `city` VALUES ('441400', '梅州市', '440000', '广东省', '12922466.396958', '2778030.008969');
INSERT INTO `city` VALUES ('441500', '汕尾市', '440000', '广东省', '12867718.496599', '2617073.44162');
INSERT INTO `city` VALUES ('441600', '河源市', '440000', '广东省', '12797599.358435', '2758721.598149');
INSERT INTO `city` VALUES ('441700', '阳江市', '440000', '广东省', '12443257.915319', '2514640.294872');
INSERT INTO `city` VALUES ('441800', '清远市', '440000', '广东省', '12565686.548523', '2791629.368933');
INSERT INTO `city` VALUES ('441900', '东莞市', '440000', '广东省', '12677079.576398', '2623775.691701');
INSERT INTO `city` VALUES ('442000', '中山市', '440000', '广东省', '12623484.721555', '2573759.871157');
INSERT INTO `city` VALUES ('445100', '潮州市', '440000', '广东省', '13001041.696965', '2727009.217667');
INSERT INTO `city` VALUES ('445200', '揭阳市', '440000', '广东省', '12926902.359176', '2672482.830742');
INSERT INTO `city` VALUES ('445300', '云浮市', '440000', '广东省', '12445389.806059', '2609510.559697');
INSERT INTO `city` VALUES ('450100', '南宁市', '450000', '广西壮族自治区', '12074550.483017', '2638786.484695');
INSERT INTO `city` VALUES ('450200', '柳州市', '450000', '广西壮族自治区', '12175556.637713', '2869349.150296');
INSERT INTO `city` VALUES ('450300', '桂林市', '450000', '广西壮族自治区', '12302851.294661', '2919481.490324');
INSERT INTO `city` VALUES ('450400', '梧州市', '450000', '广西壮族自治区', '12355925.825519', '2690137.168617');
INSERT INTO `city` VALUES ('450500', '北海市', '450000', '广西壮族自治区', '12171857.724331', '2470746.703946');
INSERT INTO `city` VALUES ('450600', '防城港市', '450000', '广西壮族自治区', '12024300.189388', '2495871.69659');
INSERT INTO `city` VALUES ('450700', '钦州市', '450000', '广西壮族自治区', '12136095.769469', '2532144.199905');
INSERT INTO `city` VALUES ('450800', '贵港市', '450000', '广西壮族自治区', '12245511.186278', '2669221.137924');
INSERT INTO `city` VALUES ('450900', '玉林市', '450000', '广西壮族自治区', '12265991.851995', '2564499.561546');
INSERT INTO `city` VALUES ('451000', '百色市', '450000', '广西壮族自治区', '11832123.93476', '2751738.432204');
INSERT INTO `city` VALUES ('451100', '贺州市', '450000', '广西壮族自治区', '12397205.029679', '2797100.836716');
INSERT INTO `city` VALUES ('451200', '河池市', '450000', '广西壮族自治区', '12005348.115135', '2831887.413291');
INSERT INTO `city` VALUES ('451300', '来宾市', '450000', '广西壮族自治区', '12180211.98758', '2735378.544119');
INSERT INTO `city` VALUES ('451400', '崇左市', '450000', '广西壮族自治区', '11942067.911064', '2571915.390012');
INSERT INTO `city` VALUES ('460100', '海口市', '460000', '海南省', '12292354.081933', '2255288.62064');
INSERT INTO `city` VALUES ('460200', '三亚市', '460000', '海南省', '12180426.900898', '2080144.340085');
INSERT INTO `city` VALUES ('460300', '三沙市', '460000', '海南省', '12639986.956581', '1066623.379232');
INSERT INTO `city` VALUES ('460400', '儋州市', '460000', '海南省', '12177160.883148', '2223149.685204');
INSERT INTO `city` VALUES ('469001', '五指山市', '460000', '海南省', '12190639.056823', '2134496.374826');
INSERT INTO `city` VALUES ('469002', '琼海市', '460000', '海南省', '12291987.053186', '2179826.96906');
INSERT INTO `city` VALUES ('469005', '文昌市', '460000', '海南省', '12332861.548057', '2243164.414048');
INSERT INTO `city` VALUES ('469006', '万宁市', '460000', '海南省', '12281280.811799', '2135237.003725');
INSERT INTO `city` VALUES ('469007', '东方市', '460000', '海南省', '12113619.313319', '2154451.256912');
INSERT INTO `city` VALUES ('469021', '定安县', '460000', '海南省', '12279754.817809', '2211650.342523');
INSERT INTO `city` VALUES ('469022', '屯昌县', '460000', '海南省', '12251100.114294', '2195168.817739');
INSERT INTO `city` VALUES ('469023', '澄迈县', '460000', '海南省', '12244146.003673', '2237913.103793');
INSERT INTO `city` VALUES ('469024', '临高县', '460000', '海南省', '12213296.390856', '2250448.648822');
INSERT INTO `city` VALUES ('469025', '白沙黎族自治县', '460000', '海南省', '12173166.971664', '2179655.972562');
INSERT INTO `city` VALUES ('469026', '昌江黎族自治县', '460000', '海南省', '12133373.214066', '2181363.299471');
INSERT INTO `city` VALUES ('469027', '乐东黎族自治县', '460000', '海南省', '12137054.233963', '2112592.141563');
INSERT INTO `city` VALUES ('469028', '陵水黎族自治县', '460000', '海南省', '12239865.262846', '2101957.280151');
INSERT INTO `city` VALUES ('469029', '保亭黎族苗族自治县', '460000', '海南省', '12206434.095042', '2106725.117017');
INSERT INTO `city` VALUES ('469030', '琼中黎族苗族自治县', '460000', '海南省', '12228790.579149', '2158941.967009');
INSERT INTO `city` VALUES ('510100', '成都市', '510000', '四川省', '11569607.484264', '3587693.864706');
INSERT INTO `city` VALUES ('510300', '自贡市', '510000', '四川省', '11653538.353152', '3411856.413005');
INSERT INTO `city` VALUES ('510400', '攀枝花市', '510000', '四川省', '11324624.098189', '3099065.142911');
INSERT INTO `city` VALUES ('510500', '泸州市', '510000', '四川省', '11763065.546895', '3304556.579302');
INSERT INTO `city` VALUES ('510600', '德阳市', '510000', '四川省', '11625932.387868', '3649387.850382');
INSERT INTO `city` VALUES ('510700', '绵阳市', '510000', '四川省', '11655678.779704', '3743689.334184');
INSERT INTO `city` VALUES ('510800', '广元市', '510000', '四川省', '11776018.065483', '3797708.63527');
INSERT INTO `city` VALUES ('510900', '遂宁市', '510000', '四川省', '11741461.896326', '3584744.064687');
INSERT INTO `city` VALUES ('511000', '内江市', '510000', '四川省', '11678946.896059', '3457177.631538');
INSERT INTO `city` VALUES ('511100', '乐山市', '510000', '四川省', '11529519.873187', '3402924.022137');
INSERT INTO `city` VALUES ('511300', '南充市', '510000', '四川省', '11822941.469572', '3658088.119819');
INSERT INTO `city` VALUES ('511400', '眉山市', '510000', '四川省', '11549986.84981', '3493894.759092');
INSERT INTO `city` VALUES ('511500', '宜宾市', '510000', '四川省', '11648238.423379', '3321246.781406');
INSERT INTO `city` VALUES ('511600', '广安市', '510000', '四川省', '11874109.715087', '3558209.200445');
INSERT INTO `city` VALUES ('511700', '达州市', '510000', '四川省', '11983545.725891', '3680515.382746');
INSERT INTO `city` VALUES ('511800', '雅安市', '510000', '四川省', '11428638.535634', '3492558.166917');
INSERT INTO `city` VALUES ('511900', '巴中市', '510000', '四川省', '11915833.096261', '3765565.414239');
INSERT INTO `city` VALUES ('512000', '资阳市', '510000', '四川省', '11701746.805251', '3516205.933979');
INSERT INTO `city` VALUES ('513200', '阿坝藏族羌族自治州', '510000', '四川省', '11422782.201719', '3817132.478644');
INSERT INTO `city` VALUES ('513300', '甘孜藏族自治州', '510000', '四川省', '11130519.439717', '3630017.34869');
INSERT INTO `city` VALUES ('513400', '凉山彝族自治州', '510000', '四川省', '11363534.418979', '3234998.193519');
INSERT INTO `city` VALUES ('520100', '贵阳市', '520000', '贵州省', '11879011.498338', '3103504.682572');
INSERT INTO `city` VALUES ('520200', '六盘水市', '520000', '贵州省', '11676783.671233', '3015764.362777');
INSERT INTO `city` VALUES ('520300', '遵义市', '520000', '贵州省', '11921142.524674', '3270246.790524');
INSERT INTO `city` VALUES ('520400', '安顺市', '520000', '贵州省', '11794626.484412', '2998260.00062');
INSERT INTO `city` VALUES ('520500', '毕节市', '520000', '贵州省', '11712828.12612', '3131623.130746');
INSERT INTO `city` VALUES ('520600', '铜仁市', '520000', '贵州省', '12083308.801575', '3245195.993844');
INSERT INTO `city` VALUES ('522300', '黔西南布依族苗族自治州', '520000', '贵州省', '11740522.599044', '2908188.824685');
INSERT INTO `city` VALUES ('522600', '黔东南苗族侗族自治州', '520000', '贵州省', '12085030.457239', '3061827.201407');
INSERT INTO `city` VALUES ('522700', '黔南布依族苗族自治州', '520000', '贵州省', '11939504.17811', '3000876.899741');
INSERT INTO `city` VALUES ('530100', '昆明市', '530000', '云南省', '11451889.934583', '2923423.873064');
INSERT INTO `city` VALUES ('530300', '曲靖市', '530000', '云南省', '11570440.26953', '2962646.338568');
INSERT INTO `city` VALUES ('530400', '玉溪市', '530000', '云南省', '11377408.896859', '2770337.969591');
INSERT INTO `city` VALUES ('530500', '保山市', '530000', '云南省', '11017533.652054', '2872660.946531');
INSERT INTO `city` VALUES ('530600', '昭通市', '530000', '云南省', '11577786.147408', '3205210.850903');
INSERT INTO `city` VALUES ('530700', '丽江市', '530000', '云南省', '11190387.296299', '3115902.796789');
INSERT INTO `city` VALUES ('530800', '普洱市', '530000', '云南省', '11212325.436671', '2654751.137335');
INSERT INTO `city` VALUES ('530900', '临沧市', '530000', '云南省', '11095685.344905', '2745902.360823');
INSERT INTO `city` VALUES ('532300', '楚雄彝族自治州', '530000', '云南省', '11306659.510689', '2919059.50929');
INSERT INTO `city` VALUES ('532500', '红河哈尼族彝族自治州', '530000', '云南省', '11470016.788669', '2685360.058034');
INSERT INTO `city` VALUES ('532600', '文山壮族苗族自治州', '530000', '云南省', '11656952.667935', '2715503.02777');
INSERT INTO `city` VALUES ('532800', '西双版纳傣族自治州', '530000', '云南省', '11237036.014579', '2503150.743839');
INSERT INTO `city` VALUES ('532900', '大理白族自治州', '530000', '云南省', '11136357.856693', '2965363.035579');
INSERT INTO `city` VALUES ('533100', '德宏傣族景颇族自治州', '530000', '云南省', '10918781.53469', '2821465.451161');
INSERT INTO `city` VALUES ('533300', '怒江傈僳族自治州', '530000', '云南省', '11005999.70021', '3118854.023035');
INSERT INTO `city` VALUES ('533400', '迪庆藏族自治州', '530000', '云南省', '11069629.501997', '3243502.569245');
INSERT INTO `city` VALUES ('540100', '拉萨市', '540000', '西藏自治区', '10140302.294484', '3508337.995134');
INSERT INTO `city` VALUES ('540200', '日喀则市', '540000', '西藏自治区', '9626612.027687', '3439430.954426');
INSERT INTO `city` VALUES ('540300', '昌都市', '540000', '西藏自治区', '10801895.548599', '3604706.790869');
INSERT INTO `city` VALUES ('540400', '林芝市', '540000', '西藏自治区', '10601960.44482', '3400988.694247');
INSERT INTO `city` VALUES ('540500', '山南市', '540000', '西藏自治区', '10271082.136055', '3287339.65587');
INSERT INTO `city` VALUES ('540600', '那曲市', '540000', '西藏自治区', '9934460.258981', '3866082.82016');
INSERT INTO `city` VALUES ('542500', '阿里地区', '540000', '西藏自治区', '9191057.109055', '3903784.595558');
INSERT INTO `city` VALUES ('610100', '西安市', '610000', '陕西省', '12111260.16271', '4043134.074297');
INSERT INTO `city` VALUES ('610200', '铜川市', '610000', '陕西省', '12138209.904782', '4190602.232242');
INSERT INTO `city` VALUES ('610300', '宝鸡市', '610000', '陕西省', '11934008.918443', '4079960.798527');
INSERT INTO `city` VALUES ('610400', '咸阳市', '610000', '陕西省', '12066410.595497', '4134832.296817');
INSERT INTO `city` VALUES ('610500', '渭南市', '610000', '陕西省', '12229148.742541', '4157172.316409');
INSERT INTO `city` VALUES ('610600', '延安市', '610000', '陕西省', '12169416.423015', '4361661.080932');
INSERT INTO `city` VALUES ('610700', '汉中市', '610000', '陕西省', '11923066.99052', '3907405.03573');
INSERT INTO `city` VALUES ('610800', '榆林市', '610000', '陕西省', '12197999.031361', '4586166.973453');
INSERT INTO `city` VALUES ('610900', '安康市', '610000', '陕西省', '12125998.502713', '3863456.974978');
INSERT INTO `city` VALUES ('611000', '商洛市', '610000', '陕西省', '12234732.0259', '3981578.547613');
INSERT INTO `city` VALUES ('620100', '兰州市', '620000', '甘肃省', '11537565.711482', '4349595.794293');
INSERT INTO `city` VALUES ('620200', '嘉峪关市', '620000', '甘肃省', '10932826.35', '4841167.925773');
INSERT INTO `city` VALUES ('620300', '金昌市', '620000', '甘肃省', '11359651.655257', '4640905.470377');
INSERT INTO `city` VALUES ('620400', '白银市', '620000', '甘肃省', '11646562.680035', '4386020.402636');
INSERT INTO `city` VALUES ('620500', '天水市', '620000', '甘肃省', '11771051.501708', '4116043.635578');
INSERT INTO `city` VALUES ('620600', '武威市', '620000', '甘肃省', '11472583.256932', '4605437.482002');
INSERT INTO `city` VALUES ('620700', '张掖市', '620000', '甘肃省', '11111707.321571', '4716213.167407');
INSERT INTO `city` VALUES ('620800', '平凉市', '620000', '甘肃省', '11872361.895753', '4205527.077159');
INSERT INTO `city` VALUES ('620900', '酒泉市', '620000', '甘肃省', '10693715.325614', '4907198.450454');
INSERT INTO `city` VALUES ('621000', '庆阳市', '620000', '甘肃省', '11977273.489579', '4323520.782349');
INSERT INTO `city` VALUES ('621100', '定西市', '620000', '甘肃省', '11628005.019968', '4180497.629181');
INSERT INTO `city` VALUES ('621200', '陇南市', '620000', '甘肃省', '11713634.602746', '3975070.396222');
INSERT INTO `city` VALUES ('622900', '临夏回族自治州', '620000', '甘肃省', '11498063.590091', '4249252.132221');
INSERT INTO `city` VALUES ('623000', '甘南藏族自治州', '620000', '甘肃省', '11439936.534628', '4072648.763983');
INSERT INTO `city` VALUES ('630100', '西宁市', '630000', '青海省', '11292085.12834', '4415113.19741');
INSERT INTO `city` VALUES ('630200', '海东市', '630000', '青海省', '11392952.113822', '4346796.055352');
INSERT INTO `city` VALUES ('632200', '海北藏族自治州', '630000', '青海省', '11165417.952131', '4546266.873264');
INSERT INTO `city` VALUES ('632300', '黄南藏族自治州', '630000', '青海省', '11313540.201539', '4167402.286976');
INSERT INTO `city` VALUES ('632500', '海南藏族自治州', '630000', '青海省', '11160585.802104', '4287690.290837');
INSERT INTO `city` VALUES ('632600', '果洛藏族自治州', '630000', '青海省', '11066883.778135', '4045491.460457');
INSERT INTO `city` VALUES ('632700', '玉树藏族自治州', '630000', '青海省', '10498324.972696', '4059875.071492');
INSERT INTO `city` VALUES ('632800', '海西蒙古族藏族自治州', '630000', '青海省', '10525079.375316', '4404827.273104');
INSERT INTO `city` VALUES ('640100', '银川市', '640000', '宁夏回族自治区', '11838519.479811', '4620219.560098');
INSERT INTO `city` VALUES ('640200', '石嘴山市', '640000', '宁夏回族自治区', '11857439.188088', '4722761.197606');
INSERT INTO `city` VALUES ('640300', '吴忠市', '640000', '宁夏回族自治区', '11859124.562408', '4504238.445139');
INSERT INTO `city` VALUES ('640400', '固原市', '640000', '宁夏回族自治区', '11820468.265139', '4289023.931634');
INSERT INTO `city` VALUES ('640500', '中卫市', '640000', '宁夏回族自治区', '11744654.395496', '4441446.275471');
INSERT INTO `city` VALUES ('650100', '乌鲁木齐市', '650000', '新疆维吾尔自治区', '9771921.002277', '5425301.706005');
INSERT INTO `city` VALUES ('650200', '克拉玛依市', '650000', '新疆维吾尔自治区', '9485093.775193', '5700492.293729');
INSERT INTO `city` VALUES ('650400', '吐鲁番市', '650000', '新疆维吾尔自治区', '9999747.822468', '5220886.507279');
INSERT INTO `city` VALUES ('650500', '哈密市', '650000', '新疆维吾尔自治区', '10409829.305008', '5321979.41241');
INSERT INTO `city` VALUES ('652300', '昌吉回族自治州', '650000', '新疆维吾尔自治区', '9867049.828378', '5520285.164397');
INSERT INTO `city` VALUES ('652700', '博尔塔拉蒙古自治州', '650000', '新疆维吾尔自治区', '9139866.717946', '5579329.062054');
INSERT INTO `city` VALUES ('652800', '巴音郭楞蒙古自治州', '650000', '新疆维吾尔自治区', '9736104.258845', '4803432.566244');
INSERT INTO `city` VALUES ('652900', '阿克苏地区', '650000', '新疆维吾尔自治区', '9078452.137708', '5009149.910353');
INSERT INTO `city` VALUES ('653000', '克孜勒苏柯尔克孜自治州', '650000', '新疆维吾尔自治区', '8455414.01256', '4818361.068331');
INSERT INTO `city` VALUES ('653100', '喀什地区', '650000', '新疆维吾尔自治区', '8593524.359532', '4601842.45138');
INSERT INTO `city` VALUES ('653200', '和田地区', '650000', '新疆维吾尔自治区', '9008730.837535', '4453301.377054');
INSERT INTO `city` VALUES ('654000', '伊犁哈萨克自治州', '650000', '新疆维吾尔自治区', '9142540.965055', '5381497.953305');
INSERT INTO `city` VALUES ('654200', '塔城地区', '650000', '新疆维吾尔自治区', '9439388.115071', '5726908.77105');
INSERT INTO `city` VALUES ('654300', '阿勒泰地区', '650000', '新疆维吾尔自治区', '9840107.994963', '5931944.016006');
INSERT INTO `city` VALUES ('659001', '石河子市', '650000', '新疆维吾尔自治区', '9577741.827669', '5513217.976413');
INSERT INTO `city` VALUES ('659002', '阿拉尔市', '650000', '新疆维吾尔自治区', '9052108.167054', '4953507.392686');
INSERT INTO `city` VALUES ('659003', '图木舒克市', '650000', '新疆维吾尔自治区', '8812474.706282', '4847156.567814');
INSERT INTO `city` VALUES ('659004', '五家渠市', '650000', '新疆维吾尔自治区', '9746778.213902', '5521667.191295');
INSERT INTO `city` VALUES ('659005', '北屯市', '650000', '新疆维吾尔自治区', '9791617.680024', '5982088.070845');
INSERT INTO `city` VALUES ('659006', '铁门关市', '650000', '新疆维吾尔自治区', '9533986.931595', '5130914.512207');
INSERT INTO `city` VALUES ('659007', '双河市', '650000', '新疆维吾尔自治区', '9168967.67477', '5601998.11206');
INSERT INTO `city` VALUES ('659008', '可克达拉市', '650000', '新疆维吾尔自治区', '8981668.787246', '5452578.679211');
INSERT INTO `city` VALUES ('659009', '昆玉市', '650000', '新疆维吾尔自治区', '8792607.725875', '4507325.273165');
INSERT INTO `city` VALUES ('659010', '胡杨河市', '650000', '新疆维吾尔自治区', '9438496.980236', '5596929.018867');

SET FOREIGN_KEY_CHECKS = 1;