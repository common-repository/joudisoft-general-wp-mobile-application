[[AWP.sets.options
<div class="row">
  <form class="form-horizontal" target="" method="post">
    <div class="col-md-12 col-sm-12 col-xs-12">
           <ul class="nav nav-pills">
             <li class="active"><a data-toggle="pill" href="#render_nav_general"><i class="fa fa-tablet"></i> General</a></li>
             <li><a data-toggle="pill" href="#render_nav_colors"><i class="fa fa-tint"></i> Colors</a></li>
             <li><a data-toggle="pill" href="#render_nav_branding"><i class="fa fa-leaf"></i> Branding</a></li>
             <li><a data-toggle="pill" href="#render_nav_native_menu"><i class="fa fa-list"></i> Native Menu</a></li>
             <li><a data-toggle="pill" href="#render_nav_custom_menu"><i class="fa fa-list"></i> Custom Menu</a></li>
             <li><a data-toggle="pill" href="#render_nav_contact_info"><i class="fa fa-envelope"></i> Contact</a></li>
             <li><a data-toggle="pill" href="#render_nav_social_links"><i class="fa fa-facebook"></i> Social</a></li>
             <li><a data-toggle="pill" href="#render_nav_google_admob"><i class="fa fa-google"></i> AdMob</a></li>
           </ul>

           <div class="tab-content pad-t-20">
             <div id="render_nav_general" class="tab-pane in active">
               <div class="col-md-12 col-sm-12 col-xs-12">
                 <div class="form-group">
                   <label class="control-label col-md-3 col-sm-3 col-xs-12">Language</label>
                   <div class="col-md-4 col-sm-5 col-xs-12">
                     <select name="language" class="form-control select" required>
                         <option value="en">English</option>
                       </select>
                   </div>
                 </div>
                 <div class="form-group">
                   <label class="control-label col-md-3 col-sm-3 col-xs-12">Aapplication Home</label>
                   <div class="col-md-5 col-sm-7 col-xs-12">
                     <select name="home_page_id" class="form-control select" select-current-value="{$home_page_id}">
                         <option value="0">Default - Latest Posts</option>
                         ?$DATA.blog.pages
                         [$DATA.blog.pages]
                         <option value="{$id}">{$title}</option>
                         [/$DATA.blog.pages]
                         $DATA.blog.pages?
                       </select>
                   </div>
                 </div>
                 <div class="form-group">
                   <label class="control-label col-md-3 col-sm-3 col-xs-12">Page Direction</label>
                   <div class="col-md-4 col-sm-5 col-xs-12">
                       <select name="page_direction" class="form-control select" select-current-value="{$page_direction}" required>
                         <option value="left">Left</option>
                         <option value="right">Right</option>
                       </select>
                   </div>
                 </div>
                 <div class="form-group">
                   <label class="control-label col-md-3 col-sm-3 col-xs-12">Posts Template</label>
                   <div class="col-md-4 col-sm-5 col-xs-12">
                       <select name="posts_template" class="form-control select" select-current-value="{$posts_template}" required>
                         <option value="cards">Cards</option>
                         <option value="cards2">Cards2</option>
                         <option value="list">List</option>
                       </select>
                   </div>
                 </div>
                 <div class="form-group">
                  <label class="control-label col-md-3 col-sm-3 col-xs-12">Excerpt</label>
                    <div class="col-md-3 col-sm-4 col-xs-12">
                      <select name="excerpt_class" class="form-control select" select-current-value="{$excerpt_class}" required>
                          <option value="description-normal">Normal</option>
                          <option value="description-wrapped">Wrapped</option>
                          <option value="description-justified">Justified</option>
                       </select>
                       <p class="help-block">Alignment</p>
                   </div>
                   <div class="col-md-2 col-sm-5 col-xs-12">
                      <input type="number" class="form-control" name="max_excerpt_length" max="999" min="0" value="{$max_excerpt_length}" required>
                      <p class="help-block">Max Length<br><span class="font-10">Num of Letters (e.g. 200)</span></p>
                  </div>
                 </div>
                 <div class="form-group">
                   <label class="control-label col-md-3 col-sm-3 col-xs-12">Home Slider</label>
                   <div class="col-md-4 col-sm-5 col-xs-12">
                     <select name="home_slider" class="form-control select" ?$home_slider select-current-value="{$home_slider}" $home_slider?>
                         <option value="">Disabled</option>
                         <option value="1">Enabled</option>
                       </select>
                   </div>
                 </div>
                 <div class="form-group">
                   <label class="control-label col-md-3 col-sm-3 col-xs-12">Category Slider</label>
                   <div class="col-md-4 col-sm-5 col-xs-12">
                     <select name="category_slider" class="form-control select" ?$category_slider select-current-value="{$category_slider}" $category_slider?>
                         <option value="">Disabled</option>
                         <option value="1">Enabled</option>
                       </select>
                   </div>
                 </div>
                 <div class="form-group">
                   <label class="control-label col-md-3 col-sm-3 col-xs-12">Comments</label>
                   <div class="col-md-4 col-sm-5 col-xs-12">
                     <select name="enable_comments" class="form-control select" ?$enable_comments select-current-value="{$enable_comments}" $enable_comments?>
                         <option value="">Disabled</option>
                         <option value="1">Enabled</option>
                       </select>
                   </div>
                 </div>
                  <div class="form-group">
                    <label class="control-label col-md-3 col-sm-3 col-xs-12">Website URL</label>
                    <div class="col-md-7 col-sm-9 col-xs-12">
                         <input class="form-control" name="website_url" type="url" pattern="https?://.+" value="{$website_url}" required>
                    </div>
                    <div class="col-md-offset-3 col-sm-offset-3 col-md-9 col-sm-7 col-xs-12">
                      <p class="help-block">The website link will be used if enable visit us menu item</p>
                    </div>
                  </div>
               </div>
             </div>
             <div id="render_nav_colors" class="tab-pane">
               <div class="col-md-12 col-sm-12 col-xs-12">
                 <div class="form-group">
                   <label class="control-label col-md-3 col-sm-3 col-xs-12">Primary Color</label>
                   <div class="col-md-6 col-sm-8 col-xs-12">
                       <select name="general_color" class="colorpicker-select-input colorpicker_select" ?$DATA.general_color_ref select-current-value="{$DATA.general_color_ref}" $DATA.general_color_ref? required>
                         [$DATA.ionic.colors]
                         <option value="{$_item}">{$_key}</option>
                         [/$DATA.ionic.colors]
                       </select>
                   </div>
                 </div>
                 <div class="form-group">
                   <label class="control-label col-md-3 col-sm-3 col-xs-12">Status Bar</label>
                   <div class="col-md-6 col-sm-8 col-xs-12">
                       <input name="statusbar_color" type="text" class="spectrum-input spectrum-input-empty" value="{$statusbar_color}">
                   </div>
                 </div>
                 <div class="form-group">
                   <label class="control-label col-md-3 col-sm-3 col-xs-12">Brand Title</label>
                   <div class="col-md-6 col-sm-9 col-xs-12">
                       <input name="brand_title_color" type="text" class="spectrum-input spectrum-input-default" value="?$brand_title_color {$brand_title_color} @else@ #000 $brand_title_color?">

                       <select name="brand_title_decoration" class="select" ?$brand_title_decoration select-current-value="{$brand_title_decoration}" $brand_title_decoration? required>
                           <option value="none">Normal</option>
                           <option value="underline">Underline</option>
                           <option value="overline">Overline</option>
                         </select>
                   </div>
                 </div>
                 <div class="form-group">
                   <label class="control-label col-md-3 col-sm-3 col-xs-12">Headlines</label>
                   <div class="col-md-6 col-sm-9 col-xs-12">
                       <input name="post_headline_color" type="text" class="spectrum-input spectrum-input-default" value="?$post_headline_color {$post_headline_color} @else@ #000 $post_headline_color?">

                       <select name="post_headline_decoration" class="select" ?$post_headline_decoration select-current-value="{$post_headline_decoration}" $post_headline_decoration? required>
                           <option value="none">Normal</option>
                           <option value="underline">Underline</option>
                           <option value="overline">Overline</option>
                         </select>
                   </div>
                 </div>
                 <div class="form-group">
                   <label class="control-label col-md-3 col-sm-3 col-xs-12">Post Title</label>
                   <div class="col-md-6 col-sm-9 col-xs-12">
                         <input name="post_title_color" type="text" class="spectrum-input spectrum-input-default" value="?$post_title_color {$post_title_color} @else@ #000 $post_title_color?">

                         <select name="post_title_decoration" class="select" ?$post_title_decoration select-current-value="{$post_title_decoration}" $post_title_decoration? required>
                             <option value="none">Normal</option>
                             <option value="underline">Underline</option>
                             <option value="overline">Overline</option>
                         </select>
                   </div>
                 </div>
                 <div class="form-group">
                   <label class="control-label col-md-3 col-sm-3 col-xs-12">Page Title</label>
                   <div class="col-md-6 col-sm-9 col-xs-12">
                       <input name="page_title_color" type="text" class="spectrum-input spectrum-input-default" value="?$page_title_color {$page_title_color} @else@ #000 $page_title_color?">

                       <select name="page_title_decoration" class="select" ?$page_title_decoration select-current-value="{$page_title_decoration}" $page_title_decoration? required>
                           <option value="none">Normal</option>
                           <option value="underline">Underline</option>
                           <option value="overline">Overline</option>
                         </select>
                   </div>
                 </div>
               </div>
             </div>
             <div id="render_nav_branding" class="tab-pane">
               <div class="col-md-12 col-sm-12 col-xs-12">
                 <div class="form-group">
                   <label class="control-label col-md-3 col-sm-3 col-xs-12">Display</label>
                   <div class="col-md-4 col-sm-6 col-xs-12">
                     <select name="application_menu_brand_type" class="form-control select" ?$application_menu_brand_type select-current-value="{$application_menu_brand_type}" $application_menu_brand_type?>
                         <option value="">Hidden</option>
                         <option value="title_slogan_logo_small">Small Logo</option>
                         <option value="logo_large_title_slogan">Large Logo</option>
                       </select>
                   </div>
                 </div>
                 <div class="form-group">
                    <label class="control-label col-md-3 col-sm-3 col-xs-12">Logo</label>
                    <div class="col-md-9 col-sm-12 col-xs-12">
                      <div class="input-group">
                        <span class="input-group-btn">
                          <button type="button" image-url-input="#application_menu_logo" image-url-preview="#logo-preview-port" name="logo-upload-btn" class="btn btn-primary bg-blue-gradient border-none wp-image-upload-btn"><i class="fa fa-upload"></i>&ensp;Change Logo</button>
                        </span>
                        <input name="application_menu_logo" type="text" id="application_menu_logo" class="form-control"  value="{$application_menu_logo}" readonly required>
                      </div>
                      <div class="image-contain"><img id="logo-preview-port" class="image-preview-logo" ?$application_menu_logo src="{$application_menu_logo}" @else@  src="{$AWP.plugin.plugin_url}/assets/img/default-android.png" $application_menu_logo? alt="Brand Logo"/></div>
                    </div>
                    <div class="col-md-offset-3 col-sm-offset-3 col-md-9 col-sm-7 col-xs-12">
                      <p class="help-block">This logo appear inside the application may be different or same as your application icon</p>
                    </div>
                 </div>
                 <div class="form-group">
                   <label class="control-label col-md-3 col-sm-3 col-xs-12">Title</label>
                   <div class="col-md-6 col-sm-9 col-xs-12">
                       <div class="input-group" style="width: 100%">
                           <input name="application_menu_title" type="text" class="form-control" id="application_title_nav" pattern=".{1,50}" value="{$application_menu_title}">
                           <span class="input-group-addon"><input type="checkbox" class="title-hide-control" input-control-default="{$application_menu_title}" input-control-ref="#application_title_nav" !$application_menu_title checked $application_menu_title!> Hide</span>
                       </div>
                   </div>
                   <div class="col-md-offset-3 col-sm-offset-3 col-md-9 col-sm-7 col-xs-12">
                     <p class="help-block">This title appear inside the application may be different or same as your application original name</p>
                   </div>
                 </div>
                 <div class="form-group">
                   <label class="control-label col-md-3 col-sm-3 col-xs-12">Slogan</label>
                   <div class="col-md-6 col-sm-9 col-xs-12">
                       <div class="input-group" style="width: 100%">
                           <input name="application_menu_slogan" type="text" class="form-control" id="application_slogan_nav" pattern=".{1,128}" value="{$application_menu_slogan}">
                           <span class="input-group-addon"><input type="checkbox" class="title-hide-control" input-control-default="{$application_menu_slogan}" input-control-ref="#application_slogan_nav" !$application_menu_slogan checked $application_menu_slogan!> Hide</span>
                       </div>
                   </div>
                 </div>
               </div>
             </div>
             <div id="render_nav_native_menu" class="tab-pane">
               <div class="col-md-12 col-sm-12 col-xs-12">
                 <div class="form-group">
                   <label class="control-label col-md-3 col-sm-3 col-xs-12">Home</label>
                   <div class="col-md-6 col-sm-8 col-xs-12">
                       <div class="input-group" style="width: 100%">
                           <input name="home_title" type="text" class="form-control" id="home_title_nav" pattern=".{1,50}" placeholder="Home" ?$home_title value="{$home_title}" $home_title?>
                           <span class="input-group-addon"><input type="checkbox" class="title-hide-control" input-control-default="{$home_title}"  input-control-ref="#home_title_nav" !$home_title checked $home_title!> Hide</span>
                       </div>
                   </div>
                 </div>
                 <div class="form-group">
                   <label class="control-label col-md-3 col-sm-3 col-xs-12">Posts</label>
                   <div class="col-md-6 col-sm-9 col-xs-12">
                       <div class="input-group" style="width: 100%">
                           <input name="posts_title" type="text" class="form-control" id="posts_title_nav" pattern=".{1,50}" placeholder="Posts" value="{$posts_title}">
                           <span class="input-group-addon"><input type="checkbox" class="title-hide-control" input-control-default="{$posts_title}" input-control-ref="#posts_title_nav" !$posts_title checked $posts_title!> Hide</span>
                       </div>
                   </div>
                 </div>
                 <div class="form-group">
                   <label class="control-label col-md-3 col-sm-3 col-xs-12">Categories</label>
                   <div class="col-md-6 col-sm-9 col-xs-12">
                       <div class="input-group" style="width: 100%">
                           <input name="categories_title" type="text" class="form-control" id="categories_title_nav" pattern=".{1,50}" placeholder="Categories" value="{$categories_title}">
                           <span class="input-group-addon"><input type="checkbox" class="title-hide-control" input-control-default="{$categories_title}"  input-control-ref="#categories_title_nav" !$categories_title checked $categories_title!> Hide</span>
                       </div>
                   </div>
                 </div>
                 <div class="form-group">
                   <label class="control-label col-md-3 col-sm-3 col-xs-12">Bookmarks</label>
                   <div class="col-md-6 col-sm-9 col-xs-12">
                       <div class="input-group" style="width: 100%">
                           <input name="bookmarks_title" type="text" class="form-control" id="bookmarks_title_nav" pattern=".{1,50}" placeholder="Bookmarks" value="{$bookmarks_title}">
                           <span class="input-group-addon"><input type="checkbox" class="title-hide-control" input-control-default="{$bookmarks_title}" input-control-ref="#bookmarks_title_nav" !$bookmarks_title checked $bookmarks_title!> Hide</span>
                       </div>
                   </div>
                 </div>
                 <div class="form-group">
                   <label class="control-label col-md-3 col-sm-3 col-xs-12">Settings</label>
                   <div class="col-md-6 col-sm-9 col-xs-12">
                       <div class="input-group" style="width: 100%">
                           <input name="settings_title" type="text" class="form-control" id="settings_title_nav" pattern=".{1,50}" placeholder="Settings" ?$settings_title value="{$settings_title}" $settings_title?>
                           <span class="input-group-addon"><input type="checkbox" class="title-hide-control" input-control-default="{$settings_title}" input-control-ref="#settings_title_nav" !$settings_title checked $settings_title!> Hide</span>
                       </div>
                   </div>
                 </div>
                 <div class="form-group">
                   <label class="control-label col-md-3 col-sm-3 col-xs-12">Website</label>
                   <div class="col-md-6 col-sm-9 col-xs-12">
                       <div class="input-group" style="width: 100%">
                           <input name="visit_website_title" type="text" class="form-control" id="visit_website_nav" pattern=".{1,50}" placeholder="Visit Us" ?$visit_website_title value="{$visit_website_title}" $visit_website_title?>
                           <span class="input-group-addon"><input type="checkbox" class="title-hide-control" input-control-default="{$visit_website_title}" input-control-ref="#visit_website_nav" !$visit_website_title checked $visit_website_title!> Hide</span>
                       </div>
                   </div>
                 </div>
                 <div class="form-group">
                   <label class="control-label col-md-3 col-sm-3 col-xs-12">Search</label>
                   <div class="col-md-6 col-sm-9 col-xs-12">
                       <div class="input-group" style="width: 100%">
                           <input name="search_title" type="text" class="form-control" id="search_title_nav" pattern=".{1,50}" placeholder="Search" ?$search_title value="{$search_title}" $search_title?>
                           <span class="input-group-addon"><input type="checkbox" class="title-hide-control" input-control-default="{$search_title}" input-control-ref="#search_title_nav" !$search_title checked $search_title!> Hide</span>
                       </div>
                   </div>
                 </div>
               </div>
             </div>
             <div id="render_nav_custom_menu" class="tab-pane">
               <div class="col-md-12 col-sm-12 col-xs-12">
                 <div class="form-group">
                   <label class="control-label col-md-3 col-sm-3 col-xs-12">Menu Position</label>
                   <div class="col-md-6 col-sm-8 col-xs-12">
                       <select name="custom_menu_position" class="form-control select" ?$custom_menu_position select-current-value="{$custom_menu_position}" $custom_menu_position?>
                          <option value="">Hidden</option>
                          <option value="top">Top - Above Native Menu</option>
                          <option value="bottom">Bottom - Below Native Menu</option>
                       </select>
                   </div>
                 </div>
                 <div class="form-group">
                   <div class="col-md-12 col-sm-12 col-xs-12">
                     <div id="custom_menu_items_container">
                       <div id="default_menu_item_template" class="mar-5 custom-menu-item-group" style="display:none;">
                         <div class="form-group">
                           <label class="control-label text-blue col-md-3 col-sm-3 col-xs-12">Page</label>
                           <div class="col-md-9 col-sm-9 col-xs-12">
                             <select name="custom_menu_items[]" class="form-control custom-menu-item-select">
                                 ?$DATA.blog.pages
                                 [$DATA.blog.pages]
                                 <option value="{$id}">{$title}</option>
                                 [/$DATA.blog.pages]
                                 $DATA.blog.pages?
                               </select>
                           </div>
                         </div>
                         <div class="form-group">
                           <label class="control-label text-blue col-md-3 col-sm-3 col-xs-12">Title</label>
                           <div class="col-md-9 col-sm-9 col-xs-12">
                             <input name="custom_menu_titles[]" type="text" class="form-control custom-menu-item-title" pattern=".{1,50}" placeholder="">
                           </div>
                         </div>
                         <div class="form-group">
                           <label class="control-label text-blue col-md-3 col-sm-3 col-xs-12">Icon</label>
                           <div class="col-md-5 col-sm-7 col-xs-12">
                             <select name="custom_menu_icons[]" class="form-control custom-menu-item-icon" data-live-search="true">
                               <option value="" selected>None</option>
                               ?$DATA.ionic.icons_list
                               [$DATA.ionic.icons_list]
                                <option value="{$value}">{$value}</option>
                               [/$DATA.ionic.icons_list]
                               ?$DATA.ionic.icons_list
                             </select>
                           </div>
                           <div class="col-md-offset-3 col-sm-offset-3 col-md-9 col-sm-7 col-xs-12">
                             <p class="help-block"><a href="https://ionicons.com/cheatsheet.html" target="_blank">Click here to preview all icon codes</a></p>
                           </div>
                         </div>
                         <div class="form-group">
                           <div class="col-md-offset-3 col-sm-offset-3 col-md-9 col-sm-9 col-xs-12">
                             <button type="button" class="btn bg-transparent text-red text-bold custom-menu-item-remove"><i class="fa fa-minus"></i>&ensp;Remove</button>
                           </div>
                         </div>
                        </div>
                        ?$DATA.custom_menu
                        [$DATA.custom_menu]
                          <div class="mar-5 custom-menu-item-group">
                            <div class="form-group">
                              <label class="control-label text-blue col-md-3 col-sm-3 col-xs-12">Page</label>
                              <div class="col-md-9 col-sm-9 col-xs-12">
                                <select name="custom_menu_items[]" class="form-control custom-menu-item-select" select-current-value="{$menu_item_id}" required>
                                    ?$DATA.blog.pages
                                    [$DATA.blog.pages]
                                    <option value="{$id}">{$title}</option>
                                    [/$DATA.blog.pages]
                                    $DATA.blog.pages?
                                  </select>
                              </div>
                            </div>
                            <div class="form-group">
                              <label class="control-label text-blue col-md-3 col-sm-3 col-xs-12">Title</label>
                              <div class="col-md-9 col-sm-9 col-xs-12">
                                <input name="custom_menu_titles[]" type="text" class="form-control custom-menu-item-title" pattern=".{1,50}" ?$menu_item_title value="{$menu_item_title}" $menu_item_title? required>
                              </div>
                            </div>
                            <div class="form-group">
                              <label class="control-label text-blue col-md-3 col-sm-3 col-xs-12">Icon</label>
                              <div class="col-md-5 col-sm-7 col-xs-12">
                                <select name="custom_menu_icons[]" class="form-control select custom-menu-item-icon" ?$menu_item_icon select-current-value="{$menu_item_icon}" $menu_item_icon? data-live-search="true">
                                  <option value="" selected>None</option>
                                  ?$DATA.ionic.icons_list
                                  [$DATA.ionic.icons_list]
                                   <option value="{$value}">{$value}</option>
                                  [/$DATA.ionic.icons_list]
                                  ?$DATA.ionic.icons_list
                                </select>
                              </div>
                              <div class="col-md-offset-3 col-sm-offset-3 col-md-9 col-sm-7 col-xs-12">
                                <p class="help-block"><a href="https://ionicons.com/cheatsheet.html" target="_blank">Click here to preview all icon codes</a></p>
                              </div>
                            </div>
                            <div class="form-group">
                              <div class="col-md-offset-3 col-sm-offset-3 col-md-9 col-sm-9 col-xs-12">
                                <button type="button" class="btn bg-transparent text-red text-bold custom-menu-item-remove"><i class="fa fa-minus"></i>&ensp;Remove</button>
                              </div>
                            </div>
                           </div>
                        [/$DATA.custom_menu]
                        $DATA.custom_menu?
                      </div>
                   </div>
                 </div>
                 <div class="form-group">
                   <div class="col-md-offset-3 col-sm-offset-3 col-md-9 col-sm-9 col-xs-12">
                     <button type="button" class="btn btn-warning text-bold" id="custom_menu_items_add"><i class="fa fa-plus"></i>&ensp;New Menu Item</button>
                   </div>
                 </div>
               </div>
             </div>
             <div id="render_nav_contact_info" class="tab-pane">
               <div class="col-md-12 col-sm-12 col-xs-12">
                 <div class="form-group">
                   <label class="control-label col-md-3 col-sm-3 col-xs-12">Email</label>
                   <div class="col-md-8 col-sm-9 col-xs-12">
                       <input name="contact_email" type="email" class="form-control" placeholder="" value="{$contact_email}" required>
                   </div>
                   <div class="col-md-offset-3 col-sm-offset-3 col-md-9 col-sm-7 col-xs-12">
                     <p class="help-block">Email address you will receive contact messages from application</p>
                   </div>
                 </div>
                 <div class="form-group">
                   <label class="control-label col-md-3 col-sm-3 col-xs-12">CC</label>
                   <div class="col-md-8 col-sm-9 col-xs-12">
                       <input name="contact_cc" type="email" class="form-control" placeholder="" value="{$contact_cc}" required>
                   </div>
                   <div class="col-md-offset-3 col-sm-offset-3 col-md-9 col-sm-7 col-xs-12">
                     <p class="help-block">Email address copy of all sent messages will be sent to</p>
                   </div>
                 </div>
               </div>
             </div>
             <div id="render_nav_social_links" class="tab-pane">
               <div class="col-md-12 col-sm-12 col-xs-12">
                 <div class="form-group">
                   <label class="control-label col-md-3 col-sm-3 col-xs-12">Icons Position</label>
                   <div class="col-md-4 col-sm-8 col-xs-12">
                       <select name="social_menu_position" class="form-control select" ?$social_menu_position select-current-value="{$social_menu_position}" $social_menu_position?>
                          <option value="">Hidden</option>
                          <option value="top">Top - Above Menu</option>
                          <option value="bottom">Bottom - Below Menu</option>
                       </select>
                   </div>
                 </div>
                 <div class="form-group">
                   <label class="control-label col-md-3 col-sm-3 col-xs-12">Facebook</label>
                   <div class="col-md-8 col-sm-9 col-xs-12">
                       <div class="input-group" style="width: 100%">
                           <input name="social_facebook_link" type="url" id="facebook_link_nav" class="form-control" pattern="https?://.+" placeholder="https://www.facebook.com" value="{$social_facebook_link}">
                           <span class="input-group-addon"><input type="checkbox" class="title-hide-control" input-control-default="https://www.facebook.com" input-control-ref="#facebook_link_nav" !$social_facebook_link checked $social_facebook_link!> Hide</span>
                       </div>
                   </div>
                 </div>
                 <div class="form-group">
                   <label class="control-label col-md-3 col-sm-3 col-xs-12">Twitter</label>
                   <div class="col-md-8 col-sm-9 col-xs-12">
                       <div class="input-group" style="width: 100%">
                           <input name="social_twitter_link" type="text" id="twitter_link_nav" class="form-control" pattern="https?://.+" placeholder="https://www.twitter.com" value="{$social_twitter_link}">
                           <span class="input-group-addon"><input type="checkbox" class="title-hide-control" input-control-default="https://www.twitter.com" input-control-ref="#twitter_link_nav" !$social_twitter_link checked $social_twitter_link!> Hide</span>
                       </div>
                   </div>
                 </div>
                 <div class="form-group">
                   <label class="control-label col-md-3 col-sm-3 col-xs-12">Instagram</label>
                   <div class="col-md-8 col-sm-9 col-xs-12">
                       <div class="input-group" style="width: 100%">
                           <input name="social_instagram_link" type="text" id="istagram_link_nav" class="form-control" pattern="https?://.+" placeholder="https://www.instagram.com" value="{$social_instagram_link}">
                           <span class="input-group-addon"><input type="checkbox" class="title-hide-control" input-control-default="https://www.instagram.com" input-control-ref="#istagram_link_nav" !$social_instagram_link checked $social_instagram_link!> Hide</span>
                       </div>
                   </div>
                 </div>
               </div>
             </div>
             <div id="render_nav_google_admob" class="tab-pane">
               <div class="col-md-12 col-sm-12 col-xs-12">
                 <div class="form-group">
                   <label class="control-label col-md-3 col-sm-3 col-xs-12">Publisher ID</label>
                   <div class="col-md-6 col-sm-12 col-xs-12">
                      <input name="google_admob_pub_id" type="text" class="form-control" pattern=".{10,128}" placeholder="ca-app-pub-XXXXXXXXXXXXXXXX~XXXXXXXXXX" value="{$google_admob_pub_id}" !$AWP.sets.application.is_license readonly $AWP.sets.application.is_license!>
                   </div>
                   <div class="col-md-offset-3 col-sm-offset-3 col-md-9 col-sm-7 col-xs-12">
                     <p class="help-block"><a href="https://support.google.com/admob/answer/2784578?hl=en" target="_blank">Click to know how to find your Publisher ID</a></p>
                   </div>
                 </div>
                 <div class="form-group">
                   <label class="control-label col-md-3 col-sm-3 col-xs-12">Ad Unit ID</label>
                   <div class="col-md-6 col-sm-12 col-xs-12">
                      <input name="google_admob_unit_id" type="text" class="form-control" pattern=".{10,128}" placeholder="ca-app-pub-XXXXXXXXXXXXXXXX/XXXXXXXXXX" value="{$google_admob_unit_id}" !$AWP.sets.application.is_license readonly $AWP.sets.application.is_license!>
                   </div>
                   <div class="col-md-offset-3 col-sm-offset-3 col-md-9 col-sm-7 col-xs-12">
                     <p class="help-block"><a href="https://support.google.com/admob/answer/7356431?hl=en" target="_blank">Click to know how to find your Ad Unit ID</a></p>
                   </div>
                 </div>
                 <div class="form-group">
                   <label class="control-label col-md-3 col-sm-3 col-xs-12">Ads Position</label>
                   <div class="col-md-6 col-sm-8 col-xs-12">
                     <select name="google_admob_position" class="form-control select" select-current-value="{$google_admob_position}" required>
                          <option value="TOP_CENTER">Top Center</option>
                          <option value="BOTTOM_CENTER">Bottom Center</option>
                          <option value="CENTER">Center</option>
                       </select>
                   </div>
                 </div>
                 <div class="form-group">
                   <label class="control-label col-md-3 col-sm-3 col-xs-12">Ads Size</label>
                   <div class="col-md-6 col-sm-8 col-xs-12">
                     <select name="google_admob_size" class="form-control select" select-current-value="{$google_admob_size}" required>
                          <option value="SMART_BANNER">Smart Banner</option>
                          <option value="BANNER">Banner</option>
                          <option value="MEDIUM_RECTANGLE">Medium Rectangle</option>
                          <option value="FULL_BANNER">Full Banner</option>
                          <option value="LEADERBOARD">Leaderboard</option>
                          <option value="SKYSCRAPER">Skyscraper</option>
                       </select>
                   </div>
                 </div>
               </div>
             </div>
           </div>
    </div>
    <div class="col-md-12 col-sm-12 col-xs-12">
      <div class="mar-t-25">
        <input type="hidden" name="ab_operation" value="set_options">
        <button type="submit" class="btn btn-md btn-success pad-10 pull-right text-bold"><i class="fa fa-cogs"></i>&ensp;Save Changes</button>
      </div>
    </div>
   </form>
</div>
AWP.sets.options]]
