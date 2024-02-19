{if $usertype eq 'A'}
<h1>{$module_data.module_name}</h1>

{$lng.txt_cc_configure_top_text}

<br />
{* <br /><input type="button" name="lunar_signup" value="{$lng.lbl_register}"
  onclick="javascript: window.open('https://lunar.app/personal');" /><br /> *}
<br />

{capture name=dialog}
<form action="cc_processing.php?cc_processor={$smarty.get.cc_processor|escape:" url"}" method="post">

  <table cellspacing="10">

    <tr>
      <td>{$lng.lbl_lunar_app_key}:</td>
      <td><input type="text" name="param01" size="36" value="{$module_data.param01|escape}" /></td>
    </tr>

    <tr>
      <td>{$lng.lbl_lunar_public_key}:</td>
      <td><input type="text" name="param02" size="36" value="{$module_data.param02|escape}" /></td>
    </tr>

    <tr>
      <td class="setting-name">{$lng.lbl_use_preauth_method}:</td>
      <td>
        <select name="use_preauth">
          <option value="">{$lng.lbl_auth_and_capture_method}</option>
          <option value="Y" {if $module_data.use_preauth eq 'Y' } selected="selected" {/if}>{$lng.lbl_auth_method}
          </option>
        </select>
      </td>
    </tr>

    <tr>
      <td>{$lng.lbl_lunar_payment_title}:</td>
      <td>
        {$lng.lbl_lunar_PaymentInfoTitle|substitute:"shop_language":$shop_language}
        {* <input type="text" name="param06" size="36" value="{$module_data.param06|escape|replace:" \\":""}" /> *}
      </td>
    </tr>

    <tr>
      <td>{$lng.lbl_lunar_payment_description}:</td>
      <td>
        {$lng.lbl_lunar_PaymentInfoDescription|substitute:"shop_language":$shop_language}
        {* <input type="text" name="param07" size="72" value="{$module_data.param07|escape|replace:" \\":""}" /> *}
      </td>
    </tr>

  </table>
  <br /><br />
  <input type="submit" value="{$lng.lbl_update|strip_tags:false|escape}" />
</form>
{/capture}

{include file="dialog.tpl" title=$lng.lbl_ch_settings content=$smarty.capture.dialog extra='width="100%"'}

{else}
  {$lng.lbl_lunar_cc_info}
{/if}