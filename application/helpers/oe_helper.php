<?php
if (!defined('BASEPATH')) exit('No direct script access allowed');

function getUserIdHelper($email)
{
    $CI = &get_instance();
    $CI->db->select('user_id');
    $CI->db->from(TABLE_USERS);
    $CI->db->where('email', $email);
    $query = $CI->db->get();
    $result = $query->row_array();
    return  $result;
}

function getDataHelper($userId, $tableName)
{
    $CI = &get_instance();
    $CI->db->select("$tableName.*," . TABLE_USERS . '.*');
    $CI->db->from($tableName);
    $CI->db->join(TABLE_USERS, $tableName . '.user_id = ' . TABLE_USERS . '.user_id');
    $CI->db->where($tableName . '.user_id', $userId);
    $query = $CI->db->get();
    // return $CI->db->last_query();
    $result = $query->row_array();
    return  $result;
}
