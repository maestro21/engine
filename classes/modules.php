<?php
class modules extends masterclass{

	 function extend(){  //продумать
		$this->options = 
			array(
				'isactive' => array(
					0 => 'no',
					1 => 'yes',
					),
				'defrights' => array(
					0 => 'no',
					1 => 'yes',
					)
			);
     }
}

?>