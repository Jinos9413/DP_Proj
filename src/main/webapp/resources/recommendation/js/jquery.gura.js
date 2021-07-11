(function($) {
	//add jquery function
	$.fn.gura = function(options) {
		//기본 설정값 정의
		var settings = $.extend({
			msg:"안녕! 나는 구라야",
			textColor: "#000",
			bgColor: "#cecece"
		}, options);


		// this는 선택된 jquery object 이다.
		this
		.text(settings.msg)
		.css("color", settings.textColor)
		.css("background-color", settings.bgColor);
		return this;
	};
})(jQuery);