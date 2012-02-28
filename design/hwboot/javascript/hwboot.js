/**
 * HWBoot
 *
 * @category    design
 * @package     hwboot
 * @copyright   Copyright (c) 2012 Holzweg e-commerce solutions (http://www.holzweg.com)
 * @license     http://www.gnu.org/licenses/gpl-2.0.txt GNU General Public License v2
 */

$(document).ready(function() {

    // Set up le popover
	$("[rel=popover]").popover();
	
	// Set up le carousel
	$(".carousel").carousel();

	// Set up les alerts
	$(".alert").alert();

    // automatic tabs handling
    // $('.tabs').tabs();

	// table sort example
	// ==================
	// $("#sortTableExample").tablesorter( { sortList: [[ 1, 0 ]] } )

	// add on logic
	// ============
	// $('.add-on :checkbox').click(function () {
	// if ($(this).attr('checked')) {
	  // $(this).parents('.add-on').addClass('active')
	// } else {
	  // $(this).parents('.add-on').removeClass('active')
	// }
	// })

});
