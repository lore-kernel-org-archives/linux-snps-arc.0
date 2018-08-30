From: Eugeniy.Paltsev@synopsys.com (Eugeniy Paltsev)
Date: Thu, 30 Aug 2018 13:12:39 +0000
Subject: [PATCH v2 2/2] dt-bindings: Document the Synopsys GPIO via CREG
 bindings
In-Reply-To: <20180829010230.GA16393@bogus>
References: <20180828112721.28178-1-Eugeniy.Paltsev@synopsys.com>
 <20180828112721.28178-3-Eugeniy.Paltsev@synopsys.com>
 <20180829010230.GA16393@bogus>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1535634758.4465.63.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On Tue, 2018-08-28@20:02 -0500, Rob Herring wrote:
> On Tue, Aug 28, 2018@02:27:21PM +0300, Eugeniy Paltsev wrote:
> > This patch adds documentation of device tree bindings for the Synopsys
> > GPIO via CREG driver.
> > 
> > Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
> > ---
> >  .../devicetree/bindings/gpio/snps,creg-gpio.txt    | 49 ++++++++++++++++++++++
> >  1 file changed, 49 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/gpio/snps,creg-gpio.txt
> > 
> > diff --git a/Documentation/devicetree/bindings/gpio/snps,creg-gpio.txt b/Documentation/devicetree/bindings/gpio/snps,creg-gpio.txt
> > new file mode 100644
> > index 000000000000..eb022d44ccda
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/gpio/snps,creg-gpio.txt
> > @@ -0,0 +1,49 @@
> > +GPIO via CREG (Control REGisers) driver
> 
> Bindings don't describe drivers.
> 
> > +
> > +This is is single-register MMIO GPIO driver to control such strangely mapped 
> > +outputs:
> > +
> > +31            11        8         7        5         0   < bit number
> > +|              |        |         |        |         |
> > +[   not used   | gpio-1 | shift-1 | gpio-0 | shift-0 ]   < 32 bit MMIO register
> > +                   ^                  ^
> > +                   |                  |
> > +                   |           write 0x2 == set output to "1" (on)
> > +                   |           write 0x3 == set output to "0" (off)
> > +                   |
> > +            write 0x1 == set output to "1" (on)
> > +            write 0x4 == set output to "0" (off)
> 
> What kind of crazy h/w designer designed this?

Actually this fields in register controls some multiplexers, which we want to use as IO port,
see the example:  

                /|
               / |
              |  |------ some internal line 
IO PIN -------|  |------ logic 0
              |  |------ logic 1
              |  |------ not used
               \ |
               |\|
               |
               CREG field


> > +Required properties:
> > +- compatible : "snps,creg-gpio"
> > +- reg : Exactly one register range with length 0x4.
> > +- #gpio-cells : Should be one - the pin number.
> > +- gpio-controller : Marks the device node as a GPIO controller.
> > +- snps,ngpios: Number of GPIO pins.
> > +- snps,bit-per-line: Number of bits per each gpio line (see picture).
> > +  Array the size of "snps,ngpios"
> > +- snps,shift: Shift (in bits) of the each GPIO field from the previous one in
> > +  register (see picture). Array the size of "snps,ngpios"
> > +- snps,on-val: Value should be set in corresponding field to set
> > +  output to "1" (see picture). Array the size of "snps,ngpios"
> > +- snps,off-val: Value should be set in corresponding field to set
> > +  output to "0" (see picture). Array the size of "snps,ngpios"
> 
> Convince me we need to parameterize all this. We try to avoid describing 
> h/w like this.

Well, I going to use this driver on 3 already upstreamed platforms and one upcoming.
They all have such CREG 'GPIOs' differently mapped with different IO lines number,
different enable/disable value, etc...

So I really want to create some generic and configurable driver to handle both existing
and upcoming platforms.

> > +
> > +Optional properties:
> > +- snps,default-val: default output field values. Array the size of "snps,ngpios"
> > +
> > +Example (see picture):
> > +
> > +gpio: gpio at f00014b0 {
> > +	compatible = "snps,creg-gpio";
> > +	reg = <0xf00014b0 0x4>;
> > +	gpio-controller;
> > +	#gpio-cells = <1>;
> > +	snps,ngpios = <2>;
> > +	snps,shift = <5 1>;
> > +	snps,bit-per-line = <2 3>;
> > +	snps,on-val = <2 1>;
> > +	snps,off-val = <3 4>;
> > +	snps,default-val = <2 1>;
> > +};
> > -- 
> > 2.14.4
> > 
-- 
 Eugeniy Paltsev
