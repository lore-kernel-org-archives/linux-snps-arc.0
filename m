From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Sat, 16 Apr 2016 11:37:20 +0530
Subject: Allocation of frame buffer at a specific memory range or address
In-Reply-To: <1460735338.3248.21.camel@synopsys.com>
References: <1460735338.3248.21.camel@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <5711D698.4030606@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On Friday 15 April 2016 09:18 PM, Alexey Brodkin wrote:

> And now the question is how to force DRM subsystem or just that driver
> to use whatever predefined (say via device tree) location in memory
> for data buffer allocation.

It seems this is pretty easy to do with DT reserved-memory binding.

You need to partition memory into @memory and @reserved-memory.
Later can be subdivided into more granular regions and your driver can refer to
one of the regions.

Something like below (untested)

+	memory {
+		device_type = "memory";
+		reg = <0x0 0x80000000 0x0 0xA0000000>;
+		#address-cells = <2>;
+		#size-cells = <2>;
+	};
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+		/* This memory bypasses IOC port */
+		fb_reserved at A0000000 {
+			reg = <0x0 0xA0000000 0x0 0xAF000000>;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			/* no-map;   */
+		};
+	};
+
+
+	fb0: video at 12300000 {
+		memory-region = <&fb_reserved>;
+		/* ... */
+	};

This might also need a DT helper in ARC mm init code.

+	early_init_fdt_scan_reserved_mem();

HTH,
-Vineet
