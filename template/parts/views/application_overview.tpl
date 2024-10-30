<div class="row">
    <div class="!$AWP.sets.package col-md-12 col-sm-12 @else@ col-md-7 col-sm-6 $AWP.sets.package! col-xs-12">
      [[AWP.sets.application
      <div class="mar-t-25">
            <h4 class="mar-l-20 mar-b-20 text-bold text-green"><i class="fa fa-lock"></i> Access Control Details</h4>
             <ul class="list-group">
            <li class="list-group-item width-100per inl-block">
                <label class="col-md-4 col-sm-4 col-xs-12"><i class="fa fa-caret-right fw-rl10"></i>Type</label>
                <div class="col-md-8 col-sm-8 col-xs-12">
                  <p class="font-13 text-bold">WordPress General Application</p>
                </div>
             </li>
            <li class="list-group-item width-100per inl-block">
                <label class="col-md-4 col-sm-4 col-xs-12"><i class="fa fa-caret-right fw-rl10"></i>Website</label>
                <div class="col-md-8 col-sm-8 col-xs-12">
                  <p class="font-16 text-bold"><a href="{$url}" target="_blank">{$url}</a></p>
                </div>
             </li>
             <li class="list-group-item width-100per inl-block">
                 <label class="col-md-4 col-sm-4 col-xs-12"><i class="fa fa-caret-right fw-rl10"></i>Transfer Key</label>
                 <div class="col-md-8 col-sm-8 col-xs-12">
                   <p class="font-14 text-bold text-red">{$transfer_key}</p>
                 </div>
              </li>
             <li class="list-group-item width-100per inl-block">
                 <label class="col-md-4 col-sm-4 col-xs-12"><i class="fa fa-caret-right fw-rl10"></i>API Key</label>
                 <div class="col-md-8 col-sm-8 col-xs-12">
                   <p class="font-14 text-bold text-red">{$api_key}</p>
                 </div>
              </li>
             <li class="list-group-item width-100per inl-block">
                 <label class="col-md-4 col-sm-4 col-xs-12"><i class="fa fa-caret-right fw-rl10"></i>API Secret</label>
                 <div class="col-md-8 col-sm-8 col-xs-12">
                   <p class="font-14 text-bold text-red">{$api_secret}</p>
                 </div>
              </li>
              <li class="list-group-item width-100per inl-block">
                  <label class="col-md-4 col-sm-4 col-xs-12"><i class="fa fa-caret-right fw-rl10"></i>Status</label>
                  <div class="col-md-8 col-sm-8 col-xs-12">
                    <p class="font-15 text-bold">?$is_active <span class="text-green">Active @else@ <span class="text-danger">Inactive $is_active?</span></p>
                  </div>
              </li>
              <li class="list-group-item width-100per inl-block">
                  <label class="col-md-4 col-sm-4 col-xs-12"><i class="fa fa-caret-right fw-rl10"></i>Registration</label>
                  <div class="col-md-8 col-sm-8 col-xs-12">
                    <p class="font-13">{$date_create}</p>
                  </div>
              </li>
              <li class="list-group-item width-100per inl-block">
                  <label class="col-md-4 col-sm-4 col-xs-12"><i class="fa fa-caret-right fw-rl10"></i>Subscription</label>
                  <div class="col-md-8 col-sm-8 col-xs-12">
                    <p class="font-15 text-bold">?$is_license <span class="text-green">Licensed @else@ <span class="text-info">Free $is_license? application</p>
                      !$is_license <p class="font-13">Become licensed and enjoy everything without restrictions <a href="https://joudisoft.com/licenses/application-box/" target="_blank">Click here to learn more</a></p> $is_license!
                  </div>
              </li>
              ?$is_license
              ?$date_expire
              <li class="list-group-item width-100per inl-block">
                  <label class="col-md-4 col-sm-4 col-xs-12"><i class="fa fa-caret-right fw-rl10"></i>License Expiry</label>
                  <div class="col-md-8 col-sm-8 col-xs-12">
                    <p class="font-13">{$date_expire}</p>
                  </div>
              </li>
              $date_expire?
              $is_license?
              <li class="list-group-item width-100per inl-block">
                  <label class="col-md-4 col-sm-4 col-xs-12"><i class="fa fa-caret-right fw-rl10"></i>Notifications</label>
                  <div class="col-md-8 col-sm-8 col-xs-12">
                    <p class="font-15 text-bold">?$is_license <span class="text-green">Unlimited @else@ <span class="text-orange">Restricted $is_license?</p>
                    !$is_license <p class="font-13">Be featured to enjoy unlimited notifications without restrictions <a href="https://joudisoft.com/licenses/application-box/" target="_blank">Click here to learn more</a></p> $is_license!
                  </div>
              </li>
              <li class="list-group-item width-100per inl-block">
                  <label class="col-md-4 col-sm-4 col-xs-12"><i class="fa fa-caret-right fw-rl10"></i>AdMob Ads</label>
                  <div class="col-md-8 col-sm-8 col-xs-12">
                    <p class="font-15 text-bold">?$is_license <span class="text-green">Own Control @else@ <span class="text-orange">joudiSoft Control $is_license?</p>
                    <p class="font-13">!$is_license Become featured $is_license! to Use your own Google AdMob ads in your application <a href="https://joudisoft.com/licenses/application-box/" target="_blank">Click here to learn more</a></p>
                  </div>
              </li>
            </ul>
        </div>
    </div>
    AWP.sets.application]]
    ?$AWP.sets.package
    <div class="col-md-5 col-sm-6 col-xs-12">
      <div class="row">
      [[AWP.sets.package
        <div class="col-md-12 col-sm-12 col-xs-12">
            <div class="panel panel-default">
                <div class="panel-heading bg-blue-gradient">
                    <h3 class="panel-title text-bold"><i class="fa fa-share-square fw-rl10"></i>Current Package</h3>
                </div>
                <div class="panel-body">
                    <div class="col-md-12 col-sm-12 col-xs-12">
                           ?$title ?$icon
                            <div class="mar-b-20 text-center">
                                <img class="img-responsive dis-block m-w-150px mar-auto" src="{$icon}">
                                <h4 class="text-bold">{$title}</h4>
                                ?$package_name <h5 class="text-muted">{$package_name}</h5> $package_name?
                                ?$version <h6 class="text-muted"><b>Version:</b> {$version}</h6> $version?
                                ?$author <h6 class="text-muted"><b>Author:</b> {$author}</h6> $author?
                                ?$date_create <h6 class="text-muted"><b>Date:</b> !$date_update {$date_create} @else@ {$date_update} $date_update! </h6> $date_create?
                                <div class="btn-group btn-group-md text-center">
                                  ?$download_url <a class="btn btn-warning btn-md text-bold" href="{$download_url}" target="_blank"><i class="fa fa-download fw-rl10"></i><span>!$share_url Temporary $share_url!</span> Download</a> $download_url?
                                  ?$share_url <a class="btn btn-info btn-md text-bold" href="{$share_url}" target="_blank"><i class="fa fa-share fw-rl10"></i>View / Share</a> $share_url?
                                </div>
                            </div>
                            $icon? $title?
                    </div>
                </div>
            </div>
        </div>
        AWP.sets.package]]
      </div>
    </div>
    $AWP.sets.package?
</div>
