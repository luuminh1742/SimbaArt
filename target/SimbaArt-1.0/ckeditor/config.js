/**
 * @license Copyright (c) 2003-2021, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see https://ckeditor.com/legal/ckeditor-oss-license
 */

CKEDITOR.editorConfig = function(config) {
	// Define changes to default configuration here. For example:
	config.language = 'en';
	// config.uiColor = '#AADC6E';
	 config.filebrowserBrowseUrl = 'http://localhost:8080//ckfinder/ckfinder.html';
	 config.filebrowserImageBrowseUrl = 'http://localhost:8080//ckfinder/ckfinder.html?type=Images';
	 config.filebrowserFlashBrowseUrl = 'http://localhost:8080//ckfinder/ckfinder.html?type=Flash';
	 config.filebrowserUploadUrl = '/ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Files&currentFolder=/archive/';
	 config.filebrowserImageUploadUrl = '/ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Images&currentFolder=/cars/';
	 config.filebrowserFlashUploadUrl = '/ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Flash';
};
