! function (o) {
	"use strict";
	var t = function () {};
	t.prototype.initSwitchery = function () {
		o('[data-plugin="switchery"]').each(function (t, e) {
			new Switchery(o(this)[0], o(this).data())
		})
	}, t.prototype.initMultiSelect = function () {
		o('[data-plugin="multiselect"]').multiSelect(o(this).data()), o("#my_multi_select3").multiSelect({
			selectableHeader: "<input type='text' class='form-control search-input' autocomplete='off' placeholder='search...'>",
			selectionHeader: "<input type='text' class='form-control search-input' autocomplete='off' placeholder='search...'>",
			afterInit: function (t) {
				var e = this,
					i = e.$selectableUl.prev(),
					n = e.$selectionUl.prev(),
					o = "#" + e.$container.attr("id") + " .ms-elem-selectable:not(.ms-selected)",
					c = "#" + e.$container.attr("id") + " .ms-elem-selection.ms-selected";
				e.qs1 = i.quicksearch(o).on("keydown", function (t) {
					if (40 === t.which) return e.$selectableUl.focus(), !1
				}), e.qs2 = n.quicksearch(c).on("keydown", function (t) {
					if (40 == t.which) return e.$selectionUl.focus(), !1
				})
			},
			afterSelect: function () {
				this.qs1.cache(), this.qs2.cache()
			},
			afterDeselect: function () {
				this.qs1.cache(), this.qs2.cache()
			}
		})
	}, t.prototype.initSelect2 = function () {
		o('[data-toggle="select2"]').select2()
	}, t.prototype.initInputmask = function () {
		o('[data-toggle="input-mask"]').each(function (t, e) {
			var i = o(e).data("maskFormat"),
				n = o(e).data("reverse");
			null != n ? o(e).mask(i, {
				reverse: n
			}) : o(e).mask(i)
		})
	}, t.prototype.initTouchspin = function () {
		var n = {};
		o('[data-toggle="touchspin"]').each(function (t, e) {
			var i = o.extend({}, n, o(e).data());
			o(e).TouchSpin(i)
		}), o("input[name='demo3_21']").TouchSpin({
			initval: 40,
			buttondown_class: "btn btn-primary",
			buttonup_class: "btn btn-primary"
		}), o("input[name='demo3_22']").TouchSpin({
			initval: 40,
			buttondown_class: "btn btn-primary",
			buttonup_class: "btn btn-primary"
		})
	}, t.prototype.initTimepicker = function () {
		o("#timepicker").timepicker({
			defaultTIme: !1,
			icons: {
				up: "mdi mdi-chevron-up",
				down: "mdi mdi-chevron-down"
			}
		}), o("#timepicker2").timepicker({
			showMeridian: !1,
			icons: {
				up: "mdi mdi-chevron-up",
				down: "mdi mdi-chevron-down"
			}
		}), o("#timepicker3").timepicker({
			minuteStep: 15,
			icons: {
				up: "mdi mdi-chevron-up",
				down: "mdi mdi-chevron-down"
			}
		})
	}, t.prototype.initColorpicker = function () {
		o("#default-colorpicker").colorpicker({
			format: "hex"
		}), o("#rgba-colorpicker").colorpicker(), o("#component-colorpicker").colorpicker({
			format: null
		})
	}, t.prototype.init = function () {
		this.initSwitchery(), this.initMultiSelect(), this.initSelect2(), this.initInputmask(), this.initTouchspin(), this.initTimepicker(), this.initColorpicker()
	}, o.Components = new t, o.Components.Constructor = t
}(window.jQuery),
function (t) {
	"use strict";
	window.jQuery.Components.init()
}();