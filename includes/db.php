<?php


class DB
{
    protected $host;
    protected $user;
    protected $password;
    protected $db_name;
    protected $con;

    public function __construct()
    {
        $this->host = 'localhost';
        $this->user = 'root';
        $this->password = '';
        $this->db_name = 'test';
        $this->connect();
    }

    public function connect()
    {
        $this->con = mysqli_connect($this->host, $this->user, $this->password, $this->db_name) or die('Can not connect database !');
        mysqli_select_db($this->con, $this->db_name);
        mysqli_set_charset($this->con, 'utf8');

    }

    public function esc($text)
    {
        return mysqli_real_escape_string($this->con, $text);
    }

    public function db_get_all($sql)
    {
        $result = mysqli_query($this->con, $sql);
        $data = array();

        if ($result) {
            while ($row = mysqli_fetch_assoc($result)) {
                $data[] = $row;
            }
        }

        return $data;
    }

    public function db_insert($table, $data)
    {
        $fields = array_keys($data);
        foreach ($fields as $field) {
            $e_data[$field] = mysqli_real_escape_string($this->con, $data[$field]);
        }
        $sql = "INSERT INTO `{$table}` (`" . implode('`, `', $fields) . "`) VALUES ('" . implode("', '", $e_data) . "')";

        mysqli_query($this->con, $sql);

        $inserted_id = mysqli_insert_id($this->con);
        return $inserted_id;
    }

    public function db_update($table, $data, $where)
    {
        $fields = array_keys($data);
        $e_data = array_map(null, $data);
        $sets = array();
        foreach ($fields as $field) {
            $sets[] = "{$field} = '{$e_data[$field]}'";
        }

        $sql = "UPDATE `{$table}` SET " . implode(", ", $sets) . " WHERE {$where}";
        mysqli_query($this->con, $sql);

        return mysqli_affected_rows($this->con);
    }


    public function db_delete($table, $where)
    {
        $sql = "DELETE FROM `{$table}` WHERE {$where}";
        mysqli_query($this->con, $sql);

        return mysqli_affected_rows($this->con);
    }
}





