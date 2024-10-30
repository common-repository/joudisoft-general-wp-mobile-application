<div class="row">
    <div class="col-md-12">
      <form class="form-horizontal" target="" method="post">
          <div class="form-group">
              <label class="col-md-3 col-md-3 col-xs-12 control-label">Title</label>
              <div class="col-md-6 col-sm-8 col-xs-12">
                <input name="title" class="form-control" value="" placeholder="Title" pattern=".{1,128}" required>
              </div>
          </div>
          <div class="form-group">
              <label class="col-md-3 col-md-3 col-xs-12 control-label">Message</label>
              <div class="col-md-9 col-sm-9 col-xs-12">
                <input name="text" class="form-control" value="" placeholder="Message" pattern=".{1,254}" required>
              </div>
          </div>
          <div class="form-group">
              <label class="col-md-3 col-sm-3 col-xs-12 control-label">Icon</label>
              <div class="col-md-4 col-sm-6 col-xs-12">
                <select name="icon" class="form-control select" data-live-search="true" required>
                  [$DATA.notifyicons.notification_icons]
                  <option value="{$_key}" data-content='<img class="select-img-thumb" src="{$AWP.plugin.plugin_url}/assets/img/resources/notification_icons/{$_key}"><span class="select-img-title filter-resource-icon">{$_item}</span>'></option>
                  [/$DATA.notifyicons.notification_icons]
                </select>
              </div>
          </div>
          <div class="form-group">
              <label class="col-md-3 col-sm-3 col-xs-12 control-label">Small Icon</label>
              <div class="col-md-4 col-sm-6 col-xs-12">
                  <select name="smallIcon" class="form-control select" data-live-search="true" required>
                    [$DATA.notifyicons.notification_small_icons]
                    <option value="{$_key}" data-content='<img class="select-img-thumb select-img-res-thumb" src="{$AWP.plugin.plugin_url}/assets/img/resources/notification_small_icons/{$_key}"><span class="select-img-title filter-resource-icon">{$_item}</span>'></option>
                    [/$DATA.notifyicons.notification_small_icons]
                  </select>
              </div>
          </div>
          <div class="form-group">
            <label class="col-md-3 col-sm-3 col-xs-12 control-label">Color</label>
            <div class="col-md-4 col-sm-6 col-xs-12">
                <input name="color" type="text" class="spectrum-input spectrum-input-empty">
            </div>
          </div>
          <div class="form-group">
              <label class="col-md-3 col-sm-3 col-xs-12 control-label">Interaction</label>
              <div class="col-md-4 col-sm-6 col-xs-12">
                <select class="form-control select" name="interaction" onchange="if(this.value == 'visit_link') document.getElementById('notification_link_input_group').style.display = 'block'; else document.getElementById('notification_link_input_group').style.display = 'none';">
                     <option value="" selected>Show Application</option>
                     <option value="visit_link">Visit Link / URL</option>
                </select>
              </div>
          </div>
          <div class="form-group" id="notification_link_input_group" style="display:none;">
              <label class="col-md-3 col-sm-3 col-xs-12 control-label">Link / URL</label>
              <div class="col-md-9 col-sm-9 col-xs-12">
                <input name="interaction_ref" class="form-control" placeholder="https://" pattern=".{2,1000}">
              </div>
          </div>
          <div class="form-group">
            <div class="col-md-offset-3 col-sm-offset-3 col-md-9 col-sm-9 col-xs-12">
                <input type="hidden" name="ab_operation" value="send_notification">
                  <button type="submit" class="btn btn-md btn-primary text-bold mar-10"><i class="fa fa-bell"></i>&ensp;Send Notification</button>
            </div>
          </div>
      </form>
    </div>
</div>
