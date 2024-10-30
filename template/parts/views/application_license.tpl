<div class="row">
    <div class="col-md-12">
         <form class="form-horizontal" target="" method="post">
              <div class="form-group">
                 <label class="control-label col-md-3 col-sm-3 col-xs-12">Current</label>
                 <div class="col-md-9 col-sm-9 col-xs-12">
                      <div class="form-control border-none font-16 text-bold">
                        ?$AWP.sets.application.is_license
                        <span class="text-red">{$AWP.sets.application.license_key}</span>
                        @else@
                        <span class="text-blue">Free Application</span>
                        $AWP.sets.application.is_license?
                      </div>
                 </div>
              </div>
              ?$AWP.sets.application.date_expire
              <div class="form-group">
                 <label class="control-label col-md-3 col-sm-3 col-xs-12">Expires</label>
                 <div class="col-md-9 col-sm-9 col-xs-12">
                      <div class="form-control border-none font-13 text-bold">
                        {$AWP.sets.application.date_expire} GMT
                      </div>
                 </div>
              </div>
              $AWP.sets.application.date_expire?
             <div class="form-group">
                <label class="control-label col-md-3 col-sm-3 col-xs-12">License Key</label>
                <div class="col-md-9 col-sm-9 col-xs-12">
                     <input name="license_key" type="text" class="form-control" value="" placeholder="New License Key" pattern="[0-9]{10,20}" required>
                </div>
                <div class="col-md-offset-3 col-sm-offset-3 col-md-9 col-sm-7 col-xs-12">
                   <p class="help-block">You can purchase license key from joudiSoft <a href="https://joudisoft.com/licenses/application-box/" target="_blank">Click Here</a></p>
                </div>
             </div>
              <div class="form-group">
                <div class="col-md-offset-3 col-sm-offset-3 col-md-9 col-sm-9 col-xs-12">
                   <input type="hidden" name="ab_operation" value="update_license">
                   <div class="btn-group pull-left">
                     <button type="submit" class="btn btn-md bg-green-gradient hover-white text-bold"><i class="fa fa-check"></i>&ensp;Renew / Activate License</button>
                     <a target="_blank" href="https://joudisoft.com/contact/" class="btn btn-md bg-blue-gradient hover-white text-bold"><i class="fa fa-star"></i>&ensp;Need Help</a>
                   </div>
                 </div>
              </div>
          </form>
    </div>
</div>
