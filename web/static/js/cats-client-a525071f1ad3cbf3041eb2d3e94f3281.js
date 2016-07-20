"use strict";define("cats-client/adapters/application",["exports","ember-data/adapters/json-api","cats-client/config/environment"],function(e,t,n){e.default=t.default.extend({host:n.default.APP.API_URL,namespace:"api"})}),define("cats-client/app",["exports","ember","ember-application","cats-client/resolver","ember-load-initializers","cats-client/config/environment"],function(e,t,n,r,a,l){var i=void 0;t.default.MODEL_FACTORY_INJECTIONS=!0,i=n.default.extend({modulePrefix:l.default.modulePrefix,podModulePrefix:l.default.podModulePrefix,Resolver:r.default}),(0,a.default)(i,l.default.modulePrefix),e.default=i}),define("cats-client/components/app-version",["exports","ember-cli-app-version/components/app-version","cats-client/config/environment"],function(e,t,n){var r=n.default.APP.name,a=n.default.APP.version;e.default=t.default.extend({version:a,name:r})}),define("cats-client/components/event-info",["exports","ember-component"],function(e,t){e.default=t.default.extend({classNames:["event-info"]})}),define("cats-client/components/force-graph",["exports","ember-component","d3"],function(e,t,n){e.default=t.default.extend({classNames:["force-graph"],graph:null,selectedArtist:null,didRender:function(){function e(){c.attr("x1",function(e){return e.source.x}).attr("y1",function(e){return e.source.y}).attr("x2",function(e){return e.target.x}).attr("y2",function(e){return e.target.y}),u.attr("cx",function(e){return e.x}).attr("cy",function(e){return e.y})}function t(e){n.default.event.active||d.alphaTarget(.3).restart(),e.fx=e.x,e.fy=e.y}function r(e){e.fx=n.default.event.x,e.fy=n.default.event.y}function a(e){n.default.event.active||d.alphaTarget(0),e.fx=null,e.fy=null}var l=n.default.select("svg"),i=+l.attr("width"),o=+l.attr("height"),d=n.default.forceSimulation().force("link",n.default.forceLink().id(function(e){return e.id})).force("charge",n.default.forceManyBody()).force("center",n.default.forceCenter(i/2,o/2)),s=this.get("graph"),c=n.default.select("svg g.force-graph__links").selectAll("line").data(s.links),u=n.default.select("svg g.force-graph__nodes").selectAll("circle").data(s.nodes).call(n.default.drag().on("start",t).on("drag",r).on("end",a));d.nodes(s.nodes).on("tick",e),d.force("link").links(s.links)}})}),define("cats-client/controllers/index",["exports","ember-controller","ember-computed"],function(e,t,n){e.default=t.default.extend({selectedArtist:null,sortDef:["startTime:desc"],sortedEvents:n.default.sort("model","sortDef")})}),define("cats-client/helpers/and",["exports","ember","ember-truth-helpers/helpers/and"],function(e,t,n){var r=null;t.default.Helper?r=t.default.Helper.helper(n.andHelper):t.default.HTMLBars.makeBoundHelper&&(r=t.default.HTMLBars.makeBoundHelper(n.andHelper)),e.default=r}),define("cats-client/helpers/d3-color",["exports","ember-helper","d3"],function(e,t,n){function r(e){return a(e[0])}e.d3Color=r;var a=n.default.scaleOrdinal(n.default.schemeCategory20);e.default=t.default.helper(r)}),define("cats-client/helpers/eq",["exports","ember","ember-truth-helpers/helpers/equal"],function(e,t,n){var r=null;t.default.Helper?r=t.default.Helper.helper(n.equalHelper):t.default.HTMLBars.makeBoundHelper&&(r=t.default.HTMLBars.makeBoundHelper(n.equalHelper)),e.default=r}),define("cats-client/helpers/gt",["exports","ember","ember-truth-helpers/helpers/gt"],function(e,t,n){var r=null;t.default.Helper?r=t.default.Helper.helper(n.gtHelper):t.default.HTMLBars.makeBoundHelper&&(r=t.default.HTMLBars.makeBoundHelper(n.gtHelper)),e.default=r}),define("cats-client/helpers/gte",["exports","ember","ember-truth-helpers/helpers/gte"],function(e,t,n){var r=null;t.default.Helper?r=t.default.Helper.helper(n.gteHelper):t.default.HTMLBars.makeBoundHelper&&(r=t.default.HTMLBars.makeBoundHelper(n.gteHelper)),e.default=r}),define("cats-client/helpers/is-after",["exports","ember","cats-client/config/environment","ember-moment/helpers/is-after"],function(e,t,n,r){e.default=r.default.extend({globalAllowEmpty:!!t.default.get(n.default,"moment.allowEmpty")})}),define("cats-client/helpers/is-array",["exports","ember","ember-truth-helpers/helpers/is-array"],function(e,t,n){var r=null;t.default.Helper?r=t.default.Helper.helper(n.isArrayHelper):t.default.HTMLBars.makeBoundHelper&&(r=t.default.HTMLBars.makeBoundHelper(n.isArrayHelper)),e.default=r}),define("cats-client/helpers/is-before",["exports","ember","cats-client/config/environment","ember-moment/helpers/is-before"],function(e,t,n,r){e.default=r.default.extend({globalAllowEmpty:!!t.default.get(n.default,"moment.allowEmpty")})}),define("cats-client/helpers/is-between",["exports","ember","cats-client/config/environment","ember-moment/helpers/is-between"],function(e,t,n,r){e.default=r.default.extend({globalAllowEmpty:!!t.default.get(n.default,"moment.allowEmpty")})}),define("cats-client/helpers/is-same-or-after",["exports","ember","cats-client/config/environment","ember-moment/helpers/is-same-or-after"],function(e,t,n,r){e.default=r.default.extend({globalAllowEmpty:!!t.default.get(n.default,"moment.allowEmpty")})}),define("cats-client/helpers/is-same-or-before",["exports","ember","cats-client/config/environment","ember-moment/helpers/is-same-or-before"],function(e,t,n,r){e.default=r.default.extend({globalAllowEmpty:!!t.default.get(n.default,"moment.allowEmpty")})}),define("cats-client/helpers/is-same",["exports","ember","cats-client/config/environment","ember-moment/helpers/is-same"],function(e,t,n,r){e.default=r.default.extend({globalAllowEmpty:!!t.default.get(n.default,"moment.allowEmpty")})}),define("cats-client/helpers/lt",["exports","ember","ember-truth-helpers/helpers/lt"],function(e,t,n){var r=null;t.default.Helper?r=t.default.Helper.helper(n.ltHelper):t.default.HTMLBars.makeBoundHelper&&(r=t.default.HTMLBars.makeBoundHelper(n.ltHelper)),e.default=r}),define("cats-client/helpers/lte",["exports","ember","ember-truth-helpers/helpers/lte"],function(e,t,n){var r=null;t.default.Helper?r=t.default.Helper.helper(n.lteHelper):t.default.HTMLBars.makeBoundHelper&&(r=t.default.HTMLBars.makeBoundHelper(n.lteHelper)),e.default=r}),define("cats-client/helpers/moment-calendar",["exports","ember","cats-client/config/environment","ember-moment/helpers/moment-calendar"],function(e,t,n,r){e.default=r.default.extend({globalAllowEmpty:!!t.default.get(n.default,"moment.allowEmpty")})}),define("cats-client/helpers/moment-duration",["exports","ember-moment/helpers/moment-duration"],function(e,t){Object.defineProperty(e,"default",{enumerable:!0,get:function(){return t.default}})}),define("cats-client/helpers/moment-format",["exports","ember","cats-client/config/environment","ember-moment/helpers/moment-format"],function(e,t,n,r){e.default=r.default.extend({globalAllowEmpty:!!t.default.get(n.default,"moment.allowEmpty")})}),define("cats-client/helpers/moment-from-now",["exports","ember","cats-client/config/environment","ember-moment/helpers/moment-from-now"],function(e,t,n,r){e.default=r.default.extend({globalAllowEmpty:!!t.default.get(n.default,"moment.allowEmpty")})}),define("cats-client/helpers/moment-to-now",["exports","ember","cats-client/config/environment","ember-moment/helpers/moment-to-now"],function(e,t,n,r){e.default=r.default.extend({globalAllowEmpty:!!t.default.get(n.default,"moment.allowEmpty")})}),define("cats-client/helpers/not-eq",["exports","ember","ember-truth-helpers/helpers/not-equal"],function(e,t,n){var r=null;t.default.Helper?r=t.default.Helper.helper(n.notEqualHelper):t.default.HTMLBars.makeBoundHelper&&(r=t.default.HTMLBars.makeBoundHelper(n.notEqualHelper)),e.default=r}),define("cats-client/helpers/not",["exports","ember","ember-truth-helpers/helpers/not"],function(e,t,n){var r=null;t.default.Helper?r=t.default.Helper.helper(n.notHelper):t.default.HTMLBars.makeBoundHelper&&(r=t.default.HTMLBars.makeBoundHelper(n.notHelper)),e.default=r}),define("cats-client/helpers/now",["exports","ember-moment/helpers/now"],function(e,t){Object.defineProperty(e,"default",{enumerable:!0,get:function(){return t.default}})}),define("cats-client/helpers/or",["exports","ember","ember-truth-helpers/helpers/or"],function(e,t,n){var r=null;t.default.Helper?r=t.default.Helper.helper(n.orHelper):t.default.HTMLBars.makeBoundHelper&&(r=t.default.HTMLBars.makeBoundHelper(n.orHelper)),e.default=r}),define("cats-client/helpers/pluralize",["exports","ember-inflector/lib/helpers/pluralize"],function(e,t){e.default=t.default}),define("cats-client/helpers/singularize",["exports","ember-inflector/lib/helpers/singularize"],function(e,t){e.default=t.default}),define("cats-client/helpers/xor",["exports","ember","ember-truth-helpers/helpers/xor"],function(e,t,n){var r=null;t.default.Helper?r=t.default.Helper.helper(n.xorHelper):t.default.HTMLBars.makeBoundHelper&&(r=t.default.HTMLBars.makeBoundHelper(n.xorHelper)),e.default=r}),define("cats-client/initializers/app-version",["exports","ember-cli-app-version/initializer-factory","cats-client/config/environment"],function(e,t,n){e.default={name:"App Version",initialize:(0,t.default)(n.default.APP.name,n.default.APP.version)}}),define("cats-client/initializers/container-debug-adapter",["exports","ember-resolver/container-debug-adapter"],function(e,t){e.default={name:"container-debug-adapter",initialize:function(){var e=arguments[1]||arguments[0];e.register("container-debug-adapter:main",t.default),e.inject("container-debug-adapter:main","namespace","application:main")}}}),define("cats-client/initializers/data-adapter",["exports","ember"],function(e,t){e.default={name:"data-adapter",before:"store",initialize:t.default.K}}),define("cats-client/initializers/ember-data",["exports","ember-data/setup-container","ember-data/-private/core"],function(e,t,n){e.default={name:"ember-data",initialize:t.default}}),define("cats-client/initializers/export-application-global",["exports","ember","cats-client/config/environment"],function(e,t,n){function r(){var e=arguments[1]||arguments[0];if(n.default.exportApplicationGlobal!==!1){var r,a=n.default.exportApplicationGlobal;r="string"==typeof a?a:t.default.String.classify(n.default.modulePrefix),window[r]||(window[r]=e,e.reopen({willDestroy:function(){this._super.apply(this,arguments),delete window[r]}}))}}e.initialize=r,e.default={name:"export-application-global",initialize:r}}),define("cats-client/initializers/injectStore",["exports","ember"],function(e,t){e.default={name:"injectStore",before:"store",initialize:t.default.K}}),define("cats-client/initializers/store",["exports","ember"],function(e,t){e.default={name:"store",after:"ember-data",initialize:t.default.K}}),define("cats-client/initializers/transforms",["exports","ember"],function(e,t){e.default={name:"transforms",before:"store",initialize:t.default.K}}),define("cats-client/initializers/truth-helpers",["exports","ember","ember-truth-helpers/utils/register-helper","ember-truth-helpers/helpers/and","ember-truth-helpers/helpers/or","ember-truth-helpers/helpers/equal","ember-truth-helpers/helpers/not","ember-truth-helpers/helpers/is-array","ember-truth-helpers/helpers/not-equal","ember-truth-helpers/helpers/gt","ember-truth-helpers/helpers/gte","ember-truth-helpers/helpers/lt","ember-truth-helpers/helpers/lte"],function(e,t,n,r,a,l,i,o,d,s,c,u,p){function m(){t.default.Helper||((0,n.registerHelper)("and",r.andHelper),(0,n.registerHelper)("or",a.orHelper),(0,n.registerHelper)("eq",l.equalHelper),(0,n.registerHelper)("not",i.notHelper),(0,n.registerHelper)("is-array",o.isArrayHelper),(0,n.registerHelper)("not-eq",d.notEqualHelper),(0,n.registerHelper)("gt",s.gtHelper),(0,n.registerHelper)("gte",c.gteHelper),(0,n.registerHelper)("lt",u.ltHelper),(0,n.registerHelper)("lte",p.lteHelper))}e.initialize=m,e.default={name:"truth-helpers",initialize:m}}),define("cats-client/instance-initializers/ember-data",["exports","ember-data/-private/instance-initializers/initialize-store-service"],function(e,t){e.default={name:"ember-data",initialize:t.default}}),define("cats-client/models/artist",["exports","ember-data/model","ember-data/attr","ember-data/relationships"],function(e,t,n,r){var a=["Piano","Bass","Drums","Guitar","Trumpet"];e.INSTRUMENTS=a,e.default=t.default.extend({name:(0,n.default)("string"),instrument:(0,n.default)("string"),events:(0,r.hasMany)("event",{inverse:"artists"})})}),define("cats-client/models/event",["exports","ember-data/model","ember-data/attr","ember-data/relationships"],function(e,t,n,r){e.default=t.default.extend({name:(0,n.default)("string"),artists:(0,r.hasMany)("artist",{inverse:"events",async:!1}),startTime:(0,n.default)("date")})}),define("cats-client/resolver",["exports","ember-resolver"],function(e,t){e.default=t.default}),define("cats-client/router",["exports","ember-router","cats-client/config/environment"],function(e,t,n){var r=t.default.extend({location:n.default.locationType});r.map(function(){}),e.default=r}),define("cats-client/routes/index",["exports","ember-route","cats-client/utils/create-graph","ember-instrumentation"],function(e,t,n,r){e.default=t.default.extend({beforeModel:function(){return this.store.findAll("artist")},model:function(){return this.store.findAll("event")},setupController:function(e,t){this._super.apply(this,arguments),(0,r.subscribe)("create-graph",{before:function(e,t){return t},after:function(e,t,n,r){var a=Math.round(t-r);console.log("create-graph took "+a+" ms.")}}),(0,r.instrument)("create-graph",function(){var r=(0,n.default)(t);e.set("graph",r)})}})}),define("cats-client/serializers/event",["exports","ember-data/serializers/json-api","ember-array/utils"],function(e,t,n){e.default=t.default.extend({normalizeResponse:function(e,t,r,a,l){var i=function(e){var t=e.attributes.artist_ids;t&&("string"==typeof t&&(t=t.split(",")),delete e.attributes.artist_ids,e.relationships=e.relationships||{},e.relationships.artists=e.relationships.artists||{data:[]},t.forEach(function(t){e.relationships.artists.data.push({id:t,type:"artist"})}))};return(0,n.isEmberArray)(r.data)?r.data.forEach(i):i(r.data),this._super(e,t,r,a,l)}})}),define("cats-client/services/ajax",["exports","ember-ajax/services/ajax"],function(e,t){Object.defineProperty(e,"default",{enumerable:!0,get:function(){return t.default}})}),define("cats-client/services/moment",["exports","ember","cats-client/config/environment","ember-moment/services/moment"],function(e,t,n,r){e.default=r.default.extend({defaultFormat:t.default.get(n.default,"moment.outputFormat")})}),define("cats-client/templates/components/event-info",["exports"],function(e){e.default=Ember.HTMLBars.template(function(){var e=function(){return{meta:{fragmentReason:!1,revision:"Ember@2.6.2",loc:{source:null,start:{line:13,column:2},end:{line:24,column:2}},moduleName:"cats-client/templates/components/event-info.hbs"},isEmpty:!1,arity:1,cachedFragment:null,hasRendered:!1,buildFragment:function(e){var t=e.createDocumentFragment(),n=e.createTextNode("    ");e.appendChild(t,n);var n=e.createElement("div"),r=e.createTextNode("\n        ");e.appendChild(n,r);var r=e.createElement("span");e.setAttribute(r,"class","event-info__artist_name");var a=e.createTextNode("\n          ");e.appendChild(r,a);var a=e.createComment("");e.appendChild(r,a);var a=e.createTextNode("\n        ");e.appendChild(r,a),e.appendChild(n,r);var r=e.createTextNode("\n        ");e.appendChild(n,r);var r=e.createElement("span");e.setAttribute(r,"class","event-info__instrument");var a=e.createTextNode("\n          ");e.appendChild(r,a);var a=e.createComment("");e.appendChild(r,a);var a=e.createTextNode("\n        ");e.appendChild(r,a),e.appendChild(n,r);var r=e.createTextNode("\n        ");e.appendChild(n,r);var r=e.createElement("span");e.setAttribute(r,"style","clear: both;"),e.appendChild(n,r);var r=e.createTextNode("\n      ");e.appendChild(n,r),e.appendChild(t,n);var n=e.createTextNode("\n");return e.appendChild(t,n),t},buildRenderNodes:function(e,t,n){var r=e.childAt(t,[1]),a=new Array(4);return a[0]=e.createAttrMorph(r,"class"),a[1]=e.createElementMorph(r),a[2]=e.createMorphAt(e.childAt(r,[1]),1,1),a[3]=e.createMorphAt(e.childAt(r,[3]),1,1),a},statements:[["attribute","class",["concat",["event-info__artist ",["subexpr","if",[["subexpr","eq",[["get","artist.id",["loc",[null,[15,41],[15,50]]]],["get","selectedArtist.id",["loc",[null,[15,51],[15,68]]]]],[],["loc",[null,[15,37],[15,69]]]],"selected"],[],["loc",[null,[15,32],[15,82]]]]]]],["element","action",[["get","selectArtist",["loc",[null,[14,18],[14,30]]]],["subexpr","if",[["subexpr","eq",[["get","artist.id",["loc",[null,[14,39],[14,48]]]],["get","selectedArtist.id",["loc",[null,[14,49],[14,66]]]]],[],["loc",[null,[14,35],[14,67]]]],null,["get","artist",["loc",[null,[14,73],[14,79]]]]],[],["loc",[null,[14,31],[14,80]]]]],[],["loc",[null,[14,9],[14,82]]]],["content","artist.name",["loc",[null,[17,10],[17,25]]]],["content","artist.instrument",["loc",[null,[20,10],[20,31]]]]],locals:["artist"],templates:[]}}();return{meta:{fragmentReason:{name:"missing-wrapper",problems:["multiple-nodes"]},revision:"Ember@2.6.2",loc:{source:null,start:{line:1,column:0},end:{line:26,column:0}},moduleName:"cats-client/templates/components/event-info.hbs"},isEmpty:!1,arity:0,cachedFragment:null,hasRendered:!1,buildFragment:function(e){var t=e.createDocumentFragment(),n=e.createElement("div");e.setAttribute(n,"class","event-info__name");var r=e.createTextNode("\n  ");e.appendChild(n,r);var r=e.createComment("");e.appendChild(n,r);var r=e.createTextNode("\n");e.appendChild(n,r),e.appendChild(t,n);var n=e.createTextNode("\n\n");e.appendChild(t,n);var n=e.createElement("div");e.setAttribute(n,"class","event-info__date");var r=e.createTextNode("\n  ");e.appendChild(n,r);var r=e.createComment("");e.appendChild(n,r);var r=e.createTextNode("\n");e.appendChild(n,r),e.appendChild(t,n);var n=e.createTextNode("\n\n");e.appendChild(t,n);var n=e.createElement("div");e.setAttribute(n,"class","event-info__time");var r=e.createTextNode("\n  ");e.appendChild(n,r);var r=e.createComment("");e.appendChild(n,r);var r=e.createTextNode("\n");e.appendChild(n,r),e.appendChild(t,n);var n=e.createTextNode("\n");e.appendChild(t,n);var n=e.createElement("div");e.setAttribute(n,"class","event-info__artists");var r=e.createTextNode("\n");e.appendChild(n,r);var r=e.createComment("");e.appendChild(n,r),e.appendChild(t,n);var n=e.createTextNode("\n");return e.appendChild(t,n),t},buildRenderNodes:function(e,t,n){var r=new Array(4);return r[0]=e.createMorphAt(e.childAt(t,[0]),1,1),r[1]=e.createMorphAt(e.childAt(t,[2]),1,1),r[2]=e.createMorphAt(e.childAt(t,[4]),1,1),r[3]=e.createMorphAt(e.childAt(t,[6]),1,1),r},statements:[["content","event.name",["loc",[null,[2,2],[2,16]]]],["inline","moment-format",[["get","event.startTime",["loc",[null,[6,18],[6,33]]]],"dddd M/D/YYYY"],[],["loc",[null,[6,2],[6,51]]]],["inline","moment-format",[["get","event.startTime",["loc",[null,[10,18],[10,33]]]],"LT"],[],["loc",[null,[10,2],[10,40]]]],["block","each",[["get","event.artists",["loc",[null,[13,10],[13,23]]]]],[],0,null,["loc",[null,[13,2],[24,11]]]]],locals:[],templates:[e]}}())}),define("cats-client/templates/components/force-graph",["exports"],function(e){e.default=Ember.HTMLBars.template(function(){var e=function(){return{meta:{fragmentReason:!1,revision:"Ember@2.6.2",loc:{source:null,start:{line:3,column:4},end:{line:5,column:4}},moduleName:"cats-client/templates/components/force-graph.hbs"},isEmpty:!1,arity:1,cachedFragment:null,hasRendered:!1,buildFragment:function(e){var t=e.createDocumentFragment(),n=e.createTextNode("      ");e.appendChild(t,n);var n=e.createElement("line");e.appendChild(t,n);var n=e.createTextNode("\n");return e.appendChild(t,n),t},buildRenderNodes:function(e,t,n){var r=e.childAt(t,[1]),a=new Array(1);return a[0]=e.createAttrMorph(r,"stroke-width"),a},statements:[["attribute","stroke-width",["get","link.sqrtValue",["loc",[null,[4,27],[4,41]]]]]],locals:["link"],templates:[]}}(),t=function(){return{meta:{fragmentReason:!1,revision:"Ember@2.6.2",loc:{source:null,start:{line:8,column:6},end:{line:12,column:6}},moduleName:"cats-client/templates/components/force-graph.hbs"},isEmpty:!1,arity:1,cachedFragment:null,hasRendered:!1,buildFragment:function(e){var t=e.createDocumentFragment(),n=e.createTextNode("        ");e.appendChild(t,n);var n=e.createElement("circle"),r=e.createTextNode("\n          ");e.appendChild(n,r);var r=e.createElement("title"),a=e.createComment("");e.appendChild(r,a),e.appendChild(n,r);var r=e.createTextNode("\n        ");e.appendChild(n,r),e.appendChild(t,n);var n=e.createTextNode("\n");return e.appendChild(t,n),t},buildRenderNodes:function(e,t,n){var r=e.childAt(t,[1]),a=new Array(4);return a[0]=e.createAttrMorph(r,"r"),a[1]=e.createAttrMorph(r,"dd-artist"),a[2]=e.createAttrMorph(r,"fill"),a[3]=e.createMorphAt(e.childAt(r,[1]),0,0),a},statements:[["attribute","r",["subexpr","if",[["subexpr","eq",[["get","node.id",["loc",[null,[9,27],[9,34]]]],["get","selectedArtist.id",["loc",[null,[9,35],[9,52]]]]],[],["loc",[null,[9,23],[9,53]]]],10,5],[],["loc",[null,[9,18],[9,60]]]]],["attribute","dd-artist",["get","node.id",["loc",[null,[9,73],[9,80]]]]],["attribute","fill",["subexpr","d3-color",[["get","node.group",["loc",[null,[9,99],[9,109]]]]],[],["loc",[null,[9,88],[9,111]]]]],["content","node.text",["loc",[null,[10,17],[10,30]]]]],locals:["node"],templates:[]}}();return{meta:{fragmentReason:{name:"triple-curlies"},revision:"Ember@2.6.2",loc:{source:null,start:{line:1,column:0},end:{line:16,column:0}},moduleName:"cats-client/templates/components/force-graph.hbs"},isEmpty:!1,arity:0,cachedFragment:null,hasRendered:!1,buildFragment:function(e){var t=e.createDocumentFragment();e.setNamespace("http://www.w3.org/2000/svg");var n=e.createElement("svg");e.setAttribute(n,"width","700"),e.setAttribute(n,"height","700");var r=e.createTextNode("\n  ");e.appendChild(n,r);var r=e.createElement("g");e.setAttribute(r,"class","force-graph__links");var a=e.createTextNode("\n");e.appendChild(r,a);var a=e.createComment("");e.appendChild(r,a);var a=e.createTextNode("\n    ");e.appendChild(r,a);var a=e.createElement("g");e.setAttribute(a,"class","force-graph__nodes");var l=e.createTextNode("\n");e.appendChild(a,l);var l=e.createComment("");e.appendChild(a,l);var l=e.createTextNode("    ");e.appendChild(a,l),e.appendChild(r,a);var a=e.createTextNode("\n  ");e.appendChild(r,a),e.appendChild(n,r);var r=e.createTextNode("\n");e.appendChild(n,r),e.appendChild(t,n);var n=e.createTextNode("\n");return e.appendChild(t,n),t},buildRenderNodes:function(e,t,n){var r=e.childAt(t,[0,1]),a=new Array(2);return a[0]=e.createMorphAt(r,1,1),a[1]=e.createMorphAt(e.childAt(r,[3]),1,1),a},statements:[["block","each",[["get","graph.links",["loc",[null,[3,12],[3,23]]]]],[],0,null,["loc",[null,[3,4],[5,13]]]],["block","each",[["get","graph.nodes",["loc",[null,[8,14],[8,25]]]]],[],1,null,["loc",[null,[8,6],[12,15]]]]],locals:[],templates:[e,t]}}())}),define("cats-client/templates/index",["exports"],function(e){e.default=Ember.HTMLBars.template(function(){var e=function(){return{meta:{fragmentReason:!1,revision:"Ember@2.6.2",loc:{source:null,start:{line:4,column:6},end:{line:8,column:6}},moduleName:"cats-client/templates/index.hbs"},isEmpty:!1,arity:1,cachedFragment:null,hasRendered:!1,buildFragment:function(e){var t=e.createDocumentFragment(),n=e.createTextNode("        ");e.appendChild(t,n);var n=e.createComment("");e.appendChild(t,n);var n=e.createTextNode("\n");return e.appendChild(t,n),t},buildRenderNodes:function(e,t,n){var r=new Array(1);return r[0]=e.createMorphAt(t,1,1,n),r},statements:[["inline","event-info",[],["event",["subexpr","@mut",[["get","event",["loc",[null,[5,27],[5,32]]]]],[],[]],"selectArtist",["subexpr","action",[["subexpr","mut",[["get","selectedArtist",["loc",[null,[6,36],[6,50]]]]],[],["loc",[null,[6,31],[6,51]]]]],[],["loc",[null,[6,23],[6,52]]]],"selectedArtist",["subexpr","@mut",[["get","selectedArtist",["loc",[null,[7,25],[7,39]]]]],[],[]]],["loc",[null,[5,8],[7,41]]]]],locals:["event"],templates:[]}}();return{meta:{fragmentReason:{name:"triple-curlies"},revision:"Ember@2.6.2",loc:{source:null,start:{line:1,column:0},end:{line:17,column:0}},moduleName:"cats-client/templates/index.hbs"},isEmpty:!1,arity:0,cachedFragment:null,hasRendered:!1,buildFragment:function(e){var t=e.createDocumentFragment(),n=e.createElement("div");e.setAttribute(n,"class","index-container");var r=e.createTextNode("\n  ");e.appendChild(n,r);var r=e.createElement("div");e.setAttribute(r,"class","index-container__column");var a=e.createTextNode("\n    ");e.appendChild(r,a);var a=e.createElement("div");e.setAttribute(a,"class","index-container__events");var l=e.createTextNode("\n");e.appendChild(a,l);var l=e.createComment("");e.appendChild(a,l);var l=e.createTextNode("    ");e.appendChild(a,l),e.appendChild(r,a);var a=e.createTextNode("\n  ");e.appendChild(r,a),e.appendChild(n,r);var r=e.createTextNode("\n\n  ");e.appendChild(n,r);var r=e.createElement("div");e.setAttribute(r,"class","index-container__column");var a=e.createTextNode("\n    ");e.appendChild(r,a);var a=e.createComment("");e.appendChild(r,a);var a=e.createTextNode("\n  ");e.appendChild(r,a),e.appendChild(n,r);var r=e.createTextNode("\n");e.appendChild(n,r),e.appendChild(t,n);var n=e.createTextNode("\n");return e.appendChild(t,n),t},buildRenderNodes:function(e,t,n){var r=e.childAt(t,[0]),a=new Array(2);return a[0]=e.createMorphAt(e.childAt(r,[1,1]),1,1),a[1]=e.createMorphAt(e.childAt(r,[3]),1,1),a},statements:[["block","each",[["get","sortedEvents",["loc",[null,[4,14],[4,26]]]]],[],0,null,["loc",[null,[4,6],[8,15]]]],["inline","force-graph",[],["graph",["subexpr","@mut",[["get","graph",["loc",[null,[13,24],[13,29]]]]],[],[]],"selectedArtist",["subexpr","@mut",[["get","selectedArtist",["loc",[null,[14,21],[14,35]]]]],[],[]]],["loc",[null,[13,4],[14,37]]]]],locals:[],templates:[e]}}())}),define("cats-client/utils/create-graph",["exports","cats-client/models/artist"],function(e,t){e.default=function(e){function n(e){return e.get("name")+" ("+e.get("instrument")+")"}function r(e){var t=n(e),r=e.get("id"),l=i.find(function(e){return e.id===r});if(void 0===l){var o=a(e);i.push({id:r,text:t,group:o})}}function a(e){var n=e.get("instrument");return t.INSTRUMENTS.indexOf(n)+1}function l(e,t){var n=e.get("id"),r=t.get("id"),a=o.find(function(e){return e.source===n&&e.target===r||e.source===r&&e.target===n});void 0===a?o.push({source:n,target:r,value:1,sqrtValue:1}):(a.value++,a.sqrtValue=Math.sqrt(a.value))}var i=[],o=[];return e.forEach(function(e){for(var t=e.get("artists"),n=0;n<t.length;n++){var a=t.objectAt(n);r(a);for(var i=n+1;i<t.length;i++){var o=t.objectAt(i);l(a,o)}}}),{nodes:i,links:o}}}),define("cats-client/config/environment",["ember"],function(e){var t="cats-client";try{var n=t+"/config/environment",r=e.default.$('meta[name="'+n+'"]').attr("content"),a=JSON.parse(unescape(r));return{default:a}}catch(e){throw new Error('Could not read config from meta tag with name "'+n+'".')}}),runningTests||require("cats-client/app").default.create({API_URL:"/",name:"cats-client",version:"0.0.0+0d546932"});