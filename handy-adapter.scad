module handy_adapter(into_silicone = false) {
    
    adapter_h = 47.5;
    adapter_l = 13;

    small_circle_d = 50;
    big_circle_d = 100;
    
    module lower_halfspace() {
        mirror([0, 0, 1])
        cylinder(h = 1000, r = 1000);
    }
    
    difference() {
        translate([0, 0, adapter_l - small_circle_d / 2])
            rotate([0, 90, 0])
                cylinder(h = adapter_h, d = small_circle_d, center = true);
        lower_halfspace();
    }

    difference() {
        linear_extrude(50)
        square([adapter_h, 24], center = true);
        translate([0, 0, adapter_l + big_circle_d / 2])
            rotate([0, 90, 0])
                cylinder(h = adapter_h, d = big_circle_d, center = true);
    }

    difference() {
        for (i = [1, -1])
            translate([0, 0, adapter_l - small_circle_d / 2])
                rotate([38 * i, 0, 0])
                    linear_extrude(small_circle_d / 2 + 2.2)
                        square([adapter_h, 3], center = true);
        lower_halfspace();
    }
    if (into_silicone) {
        linear_extrude(1)
            square([adapter_h, 60], center = true);
        
        for (i = [-1, 1])
            translate([0, 9 * i, 0])
                resize([adapter_h, 7, 18])
                    rotate([90, 0, 0])
                        rotate_extrude(angle = -180)
                            translate([3, 0, 0])
                                circle(d = 1);
    }
}
