<div id="application-create-modal" class="modal fade modal-dialog-form" role="dialog">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header pad-10 bg-green-gradient">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title"><i class="fa fa-plus fw-rl10"></i>Create Application</h4>
      </div>
      <form class="form-horizontal" method="post" action="">
        <div class="modal-body">
            <p class="font-16 mar-b-20">By proceeding this will communicate with joudiSoft application server with your current wordpress website data to ensure your site doesn't currently own an active application</p>
            <p class="font-15">And ofcourse you can transfer your current site application if you have previously uninstalled plugin or have changed website url by using transfer key provided after creating your application</p>
            <p class="font-15">On successfuly application create you will receive a transfer key which you can use later for getting deep access to this applicatino or transfer it to another site</p>
            <p class="font-15 text-bold">By proceeding you agree to <a target="_blank" href="https://joudisoft.com/legal/terms/">joudiSoft Terms of Service</a> and <a target="_blank" href="https://joudisoft.com/legal/privacy-policy/">Privacy Policy</a></p>
        </div>
        <div class="modal-footer">
            <div class="text-center">
                <input type="hidden" name="ab_operation" value="application_create">
                <button type="submit" class="btn btn-block btn-success btn-lg">
                  <i class="fa fa-check fw-rl10"></i>Create My Application
                </button>
                <button type="button" class="btn btn-block btn-danger" data-dismiss="modal">
                  <i class="fa fa-caret-down fw-rl10"></i>Cancel
                </button>
            </div>
        </div>
      </form>
    </div>
  </div>
</div>

<div id="application-transfer-modal" class="modal fade modal-dialog-form" role="dialog">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header pad-10 bg-blue-gradient">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title"><i class="fa fa-exchange fw-rl10"></i>Transfer Application</h4>
      </div>
      <form class="form-horizontal" method="post" action="">
        <div class="modal-body">
            <p class="font-16 mar-b-20">When you created your previous appliaction you received a transfer key, we need you to provide this key so we can transfer your application from your old site to your new site</p>
            <div class="box-rounded bg-gray">
                <div class="form-group">
                  <label class="col-md-3 col-sm-3 col-xs-12 control-label">Method</label>
                  <div class="col-md-9 col-sm-9 col-xs-12">
                    <select class="form-control" name="transfer_method" onchange="if(jQuery(this).val() == 'transfer_key') jQuery('.transfer_key_group').show(); else jQuery('.transfer_key_group').hide();" required>
                      <option value="transfer_key" selected>Using Transfer Key</option>
                      <option value="no_transfer_key">Without Transfer Key</option>
                    </select>
                  </div>
                </div>
                <div class="form-group transfer_key_group">
                  <div class="col-md-12 col-sm-12 col-xs-12">
                    <input name="transfer_key" class="form-control" type="text" pattern="[a-zA-Z0-9]{32}" value="" placeholder="Application Transfer Key">
                  </div>
                </div>
            </div>
        </div>
        <div class="modal-footer">
            <div class="text-center">
                <input type="hidden" name="ab_operation" value="application_transfer">
                <button type="submit" class="btn btn-block btn-primary btn-lg">
                  <i class="fa fa-check fw-rl10"></i>Transfer My Application
                </button>
                <button type="button" class="btn btn-block btn-danger" data-dismiss="modal">
                  <i class="fa fa-caret-down fw-rl10"></i>Cancel
                </button>
            </div>
        </div>
      </form>
    </div>
  </div>
</div>
