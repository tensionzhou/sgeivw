Google/Facebook/WindowsLive Oauth 2.0 Authentication Plugin
===========================================================

Beta version
------------

This is a none-core contributed plugin. 
You are welcome to do Pull Request on Github, to report [issues](https://github.com/mouneyrac/auth_googleoauth2/issues), 
however no support is guaranteed.

Setup the authentication services:
----------------------------------

* Google (https://code.google.com/apis/console/):

	> Google console API > API Access  
	> Redirect URLs: https://www.YOURDOMAINENAME/auth/googleoauth2/google_redirect.php  
	> Javascript origins: https://YOURDOMAINNAME

* Facebook (https://developers.facebook.com/apps):

	> Site URL: https://YOURDOMAINENAME/auth/googleoauth2/facebook_redirect.php  
	> Site domaine: www.YOURDOMAINNAME  

* Messenger Connect (https://manage.dev.live.com/Applications/Index):  
	
	> Redirect domain: https://www.YOURDOMAINNAME


Plugin installation:
--------------------

> Step 4. is about adding some code in Moodle to display the authentication providers logos. It is a just an example.
It could actually be implemented anywhere (theme, block, alternative login page...). This step requires PHP and Moodle code knowledge.

1. add the plugin into /auth/googleoauth2/

2. in Moodle admin, enable the plugin (Admin block > Plugins > Auhtentication)

3. in the plugin settings, enter your client ids + client secrets.
Note: Messenger connect is currently unsecured to be used in the way I use it because of this issue: 
(http://social.msdn.microsoft.com/Forums/en-US/messengerconnect/thread/515d546d-1155-4775-95d8-89dadc5ee929)

4. in your theme (most likely in login layout page /theme/YOURTHEME/layout/login.php), add and edit the following little piece of ugly HTML/PHP code:

        <?php 
	        //get previous auth provider
	        $allauthproviders = optional_param('allauthproviders', false, PARAM_BOOL);
	        $cookiename = 'MOODLEGOOGLEOAUTH2_'.$CFG->sessioncookie;
	        if (empty($_COOKIE[$cookiename])) {
	            $authprovider = '';
	        } else {
	            $authprovider = $_COOKIE[$cookiename];
	        }
	    ?>
        <center> 
            <br/><br/><br/>
			<?php echo get_string('signinwithanaccount','auth_googleoauth2'); ?>
			<br/><br/>
            <div style="width:'1%'">
	            <?php
	            	$displayprovider = ((empty($authprovider) || $authprovider == 'google' || $allauthproviders) && get_config('auth/googleoauth2', 'googleclientid'));
	            	$providerdisplaystyle = $displayprovider?'display:inline-block;':'display:none;';
	            ?>
	            <div class="singinprovider" style="<?php echo $providerdisplaystyle; ?>">
					<a href="https://accounts.google.com/o/oauth2/auth?client_id=<?php echo get_config('auth/googleoauth2', 'googleclientid'); ?>&redirect_uri=<?php echo $CFG->wwwroot; ?>/auth/googleoauth2/google_redirect.php&scope=https://www.googleapis.com/auth/userinfo.profile https://www.googleapis.com/auth/userinfo.email&response_type=code">
						<img src="<?php echo $CFG->wwwroot ?>/theme/YOURTHEME/pix/GOOGLELOGO.jpg" />
					</a>
	            </div>
	            <?php 
	            	$displayprovider = ((empty($authprovider) || $authprovider == 'facebook' || $allauthproviders) && get_config('auth/googleoauth2', 'facebookclientid'));
	            	$providerdisplaystyle = $displayprovider?'display:inline-block;':'display:none;';
	            ?>
	            <div class="singinprovider" style="<?php echo $providerdisplaystyle; ?> padding-left: 20px;">
					<a href="https://www.facebook.com/dialog/oauth?client_id=<?php echo get_config('auth/googleoauth2', 'facebookclientid'); ?>&redirect_uri=<?php echo $CFG->wwwroot; ?>/auth/googleoauth2/facebook_redirect.php&scope=email&response_type=code">
						<img src="<?php echo $CFG->wwwroot ?>/theme/YOURTHEME/pix/FACEBOOKLOGO.png" />
					</a>
	            </div>
	            <?php 
	            	$displayprovider = ((empty($authprovider) || $authprovider == 'messenger' || $allauthproviders) && get_config('auth/googleoauth2', 'messengerclientid'));
	            	$providerdisplaystyle = $displayprovider?'display:inline-block;':'display:none;';
	            ?>
	            <div class="singinprovider" style="<?php echo $providerdisplaystyle; ?>">
					<a href="https://oauth.live.com/authorize?client_id=<?php echo get_config('auth/googleoauth2', 'messengerclientid'); ?>&redirect_uri=<?php echo $CFG->wwwroot; ?>/auth/googleoauth2/messenger_redirect.php&scope=wl.basic wl.emails wl.signin&response_type=code">
						<img src="<?php echo $CFG->wwwroot ?>/theme/YOURTHEME/pix/MESSENGERLOGO.jpg" />
					</a>
	            </div>
            </div>
            <?php if (!empty($authprovider)) { ?>
            	<br/><br/>
            	<div class="moreproviderlink">
                	<a href='<?php echo $CFG->wwwroot . (isset($CFG->alternateloginurl) ? $CFG->alternateloginurl : '/login/index.php') . '?allauthproviders=true'; ?>' onclick="changecss('singinprovider','display','inline-block');">
						<?php echo get_string('moreproviderlink', 'auth_googleoauth2');?>
					</a>
            	</div>
            <?php } ?>
        </center>
        
    > More information about Moodle theme 2.0: http://docs.moodle.org/dev/Themes_2.0
    Basically, you want to look to your theme/config.php. Find in it what is the login layout file name. Then add this example code in this layout file.

5. (Recommended) Register on IPinfoDB for key: http://www.ipinfodb.com/register.php. Then enter the key in the plugin settings. Thus Moodle can pre-filled the city and the country of the user.

6. (Optional) Change the prefix of new users. By default they are name google_user_XXX.

> Note about debugging: the plugin doesn't work in local. Google authentication will most likely fail to the first redirection, and if you enter manually the authorization code in the URL, then it will fail when trying to get the access token. Google will return a Missing authorization error.
