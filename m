From: Eugeniy.Paltsev@synopsys.com (Eugeniy Paltsev)
Date: Tue, 22 Aug 2017 18:10:52 +0000
Subject: Specifying console via "stdout-path" property
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1503425451.2586.56.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi everyone,

I got strange results when I tried to specify device to use as console
via "stdout-path" property in device tree:
Even If I specify device in "stdout-path" property first probed device
(of those that can be used as console device) is used as console.

For example:
-------------->8--------
chosen {
????stdout-path = &serial1;
};

serial0: uart0 at ... {} /* serial0 is used as console (ttyS0) as it is
                       * probed earlier */
serial1: uart1 at ... {}
-------------->8--------

So I am wondering is it expected behavior?


Everything is fine if I specify uart device via "console" parameter in
bootargs:
-------------->8--------
chosen {
????bootargs = "console=ttyS1"
????stdout-path = &serial1;
};

serial0: uart0 at ... {}
serial1: uart1 at ... {} /* serial1 is used as console (ttyS1) */
-------------->8--------

Thanks.
-- 
?Eugeniy Paltsev
