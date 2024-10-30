<div class="row">
    <div class="col-md-12">
         <form class="form-horizontal" target="" method="post"  enctype="multipart/form-data">
              <div class="form-group">
               <label class="control-label col-md-3 col-sm-3 col-xs-12">Title</label>
               <div class="col-md-6 col-sm-8 col-xs-12">
                    <input name="title" placeholder="Application name" class="form-control" ?$AWP.sets.package.title value="{$AWP.sets.package.title}" $AWP.sets.package.title? pattern=".{2,50}" required>
               </div>
               <div class="col-md-offset-3 col-sm-offset-3 col-md-9 col-sm-7 col-xs-12">
                  <p class="help-block">As you would like it to appear on mobile devices</p>
               </div>
              </div>
              <div class="form-group">
               <label class="control-label col-md-3 col-sm-3 col-xs-12">Description</label>
               <div class="col-md-8 col-sm-9 col-xs-12">
                    <input name="description" placeholder="Breif description about application" class="form-control" ?$AWP.sets.package.description value="{$AWP.sets.package.description}" $AWP.sets.package.description? pattern=".{5,128}" required>
               </div>
               <div class="col-md-offset-3 col-sm-offset-3 col-md-9 col-sm-7 col-xs-12">
                  <p class="help-block">Write the best to describe your application</p>
               </div>
              </div>
              <div class="form-group">
                <label class="control-label col-md-3 col-sm-3 col-xs-12">Package Name</label>
                <div class="col-md-4 col-sm-8 col-xs-12">
                     <input name="package_name" ?$AWP.sets.package.package_namevalue="{$AWP.sets.package.package_name}" $AWP.sets.package.package_name? class="form-control" placeholder="com.your.application.domain" pattern=".{5,45}" required>
                </div>
                <div class="col-md-offset-3 col-sm-offset-3 col-md-9 col-sm-7 col-xs-12">
                   <p class="help-block">Uploading to Play Store package name required to be unique <a href="https://developer.android.com/studio/build/application-id.html" target="_blank">Learn more</a></p>
                </div>
              </div>
              <div class="form-group">
                <label class="control-label col-md-3 col-sm-3 col-xs-12">
                  Author
                !$AWP.sets.application.is_license
                  <br><span class="label label-warning font-10">Licensed Only</span>
                $AWP.sets.application.is_license!
                </label>
                <div class="col-md-4 col-sm-8 col-xs-12">
                     <input name="author" class="form-control" ?$AWP.sets.package.author value="{$AWP.sets.package.author}" $AWP.sets.package.author? placeholder="Author" pattern=".{3,128}" !$AWP.sets.application.is_license readonly $AWP.sets.application.is_license! required>
                </div>
                <div class="col-md-offset-3 col-sm-offset-3 col-md-9 col-sm-7 col-xs-12">
                   <p class="help-block">Developer or Company name</p>
                </div>
              </div>
              <div class="form-group">
                <label class="control-label col-md-3 col-sm-3 col-xs-12">Version</label>
                <div class="col-md-2 col-sm-3 col-xs-6">
                     <input name="version" class="form-control" type="text" ?$AWP.sets.package.version value="{$AWP.sets.package.version}" $AWP.sets.package.version? placeholder="1.0.0" step="0.0.1" min="0.0.1" pattern="^\d+(\.\d+)*$" required>
                </div>
              </div>
              <div class="form-group">
                 <label class="control-label col-md-3 col-sm-3 col-xs-12">Icon</label>
                 <div class="col-md-9 col-sm-12 col-xs-12">
                   <div class="input-group">
                     <span class="input-group-btn">
                       <button type="button" image-url-input="#build_icon_input" image-url-preview="#icon-preview-port" name="icon-upload-btn" class="btn btn-primary bg-blue-gradient border-none wp-image-upload-btn"><i class="fa fa-upload"></i>&ensp;Upload Icon</button>
                     </span>
                     <input name="icon" type="text" id="build_icon_input" class="form-control" ?$AWP.sets.package.icon value="{$AWP.sets.package.icon}" @else@ value="{$AWP.plugin.plugin_url}/assets/img/appbox-mobile-icon.png" $AWP.sets.package.icon? readonly required>
                   </div>
                   <div class="image-contain"><img id="icon-preview-port" class="image-preview-icon" ?$AWP.sets.package.icon src="{$AWP.sets.package.icon}" @else@ src="{$AWP.plugin.plugin_url}/assets/img/appbox-mobile-icon.png" $AWP.sets.package.icon? alt="Application Icon"/></div>
                 </div>
                 <div class="col-md-offset-3 col-sm-offset-3 col-md-9 col-sm-7 col-xs-12">
                 <p class="help-block">Recommended: PNG / Alpha (512px x 512px)</p>
                 </div>
              </div>
              <div class="form-group">
                 <label class="control-label col-md-3 col-sm-3 col-xs-12">Splash Screen<br><small>Portrait Mode</small></label>
                 <div class="col-md-9 col-sm-12 col-xs-12">
                   <div class="input-group">
                     <span class="input-group-btn">
                       <button type="button" image-url-input="#build_splash_portrait_input" image-url-preview="#portrait-preview-port" name="splash-portrait-upload-btn" class="btn btn-primary bg-blue-gradient border-none wp-image-upload-btn"><i class="fa fa-upload"></i>&ensp;Upload Image</button>
                     </span>
                     <input name="splash_portrait" type="text" id="build_splash_portrait_input" class="form-control" ?$AWP.sets.package.splash_portrait value="{$AWP.sets.package.splash_portrait}" @else@ value="{$AWP.plugin.plugin_url}/assets/img/splash-portrait-default.jpg" $AWP.sets.package.splash_portrait? readonly required>
                   </div>
                   <div class="image-contain"><img id="portrait-preview-port" class="image-preview-portrait" ?$AWP.sets.package.splash_portrait src="{$AWP.sets.package.splash_portrait}" @else@ src="{$AWP.plugin.plugin_url}/assets/img/splash-portrait-default.jpg" $AWP.sets.package.splash_portrait? alt="Portrait Splash Screen"/></div>
                 </div>
                 <div class="col-md-offset-3 col-sm-offset-3 col-md-9 col-sm-7 col-xs-12">
                 <p class="help-block">Recommended: width x height (720px x 960px )</p>
                 </div>
              </div>
              <div class="form-group">
                 <label class="control-label col-md-3 col-sm-3 col-xs-12">Splash Screen<br><small>Landscape Mode</small></label>
                 <div class="col-md-9 col-sm-12 col-xs-12">
                   <div class="input-group">
                     <span class="input-group-btn">
                       <button type="button" image-url-input="#build_splash_landscape_input" image-url-preview="#landscape-preview-port" name="splash-landscape-upload-btn" class="btn btn-primary bg-blue-gradient border-none wp-image-upload-btn"><i class="fa fa-upload"></i>&ensp;Upload Image</button>
                     </span>
                     <input name="splash_landscape" type="text" id="build_splash_landscape_input" class="form-control" ?$AWP.sets.package.splash_landscape value="{$AWP.sets.package.splash_landscape}" @else@ value="{$AWP.plugin.plugin_url}/assets/img/splash-landscape-default.jpg" $AWP.sets.package.splash_landscape?  readonly required>
                   </div>
                   <div class="image-contain"><img id="landscape-preview-port" class="image-preview-landscape" ?$AWP.sets.package.splash_landscape src="{$AWP.sets.package.splash_landscape}" @else@  src="{$AWP.plugin.plugin_url}/assets/img/splash-landscape-default.jpg" $AWP.sets.package.splash_landscape? alt="Landscape Splash Screen"/></div>
                 </div>
                 <div class="col-md-offset-3 col-sm-offset-3 col-md-9 col-sm-7 col-xs-12">
                       <p class="help-block">Recommended:  width x height ( 960px x 720px )</p>
                 </div>
              </div>
              <div class="form-group">
                <div class="col-md-offset-3 col-sm-offset-3 col-md-9 col-sm-9 col-xs-12">
                   <input type="hidden" name="ab_operation" value="build_app">
                   <div class="btn-group pull-left">
                     <button type="submit" class="btn btn-md bg-green-gradient hover-white text-bold"><i class="fa fa-tablet"></i>&ensp;Start Building</button>
                     <a target="_blank" href="https://joudisoft.com/contact/" class="btn btn-md bg-blue-gradient hover-white text-bold"><i class="fa fa-star"></i>&ensp;Need Help</a>
                   </div>
                 </div>
              </div>
          </form>
    </div>
</div>
