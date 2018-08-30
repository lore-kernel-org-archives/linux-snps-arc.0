From: Eugeniy.Paltsev@synopsys.com (Eugeniy Paltsev)
Date: Thu, 30 Aug 2018 18:16:06 +0000
Subject: [PATCH v2 2/2] dt-bindings: Document the Synopsys GPIO via CREG
 bindings
In-Reply-To: <CACRpkdbQryY-R+14GvYAEkLH+7Tr4Pvb6YohWouTwug7qEGbDA@mail.gmail.com>
References: <20180828112721.28178-1-Eugeniy.Paltsev@synopsys.com>
 <20180828112721.28178-3-Eugeniy.Paltsev@synopsys.com>
 <CACRpkdbQryY-R+14GvYAEkLH+7Tr4Pvb6YohWouTwug7qEGbDA@mail.gmail.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1535652965.4465.84.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On Thu, 2018-08-30@10:43 +0200, Linus Walleij wrote:
> On Tue, Aug 28, 2018 at 1:27 PM Eugeniy Paltsev
> <Eugeniy.Paltsev@synopsys.com> wrote:
> 
> > +++ b/Documentation/devicetree/bindings/gpio/snps,creg-gpio.txt
> > @@ -0,0 +1,49 @@
> > +GPIO via CREG (Control REGisers) driver
[snip]

> > +- snps,ngpios: Number of GPIO pins.
> 
> Use the existing ngpios attribute for this, see gpio.txt

Ok

> > +- snps,bit-per-line: Number of bits per each gpio line (see picture).
> > +  Array the size of "snps,ngpios"
> > +- snps,shift: Shift (in bits) of the each GPIO field from the previous one in
> > +  register (see picture). Array the size of "snps,ngpios"
> > +- snps,on-val: Value should be set in corresponding field to set
> > +  output to "1" (see picture). Array the size of "snps,ngpios"
> > +- snps,off-val: Value should be set in corresponding field to set
> > +  output to "0" (see picture). Array the size of "snps,ngpios"
> 
> Move this into a lookup table in the driver instead, and match
> the lookup table to the compatible string. The format of the
> register is known for a certain compatible, right?

Actually I really don't want to hardcode this values into lookup table as I going to use
this driver on 3 already upstreamed platforms and at least one upcoming.

They all have such CREG pseudo-'GPIOs' differently mapped with different IO lines number,
different enable/disable value, etc...

Is it really a problem to have this values configured via device tree?
If we read them from DT we are able to use this generic and configurable driver to handle
both existing and upcoming platforms without the need of patching the driver on every new
platform upstreaming.

> 
> Yours,
> Linus Walleij
-- 
 Eugeniy Paltsev
