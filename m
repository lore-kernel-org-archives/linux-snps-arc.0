From: linus.walleij@linaro.org (Linus Walleij)
Date: Wed, 5 Sep 2018 11:34:57 +0200
Subject: [PATCH v2 2/2] dt-bindings: Document the Synopsys GPIO via CREG
 bindings
In-Reply-To: <1535652965.4465.84.camel@synopsys.com>
References: <20180828112721.28178-1-Eugeniy.Paltsev@synopsys.com>
 <20180828112721.28178-3-Eugeniy.Paltsev@synopsys.com>
 <CACRpkdbQryY-R+14GvYAEkLH+7Tr4Pvb6YohWouTwug7qEGbDA@mail.gmail.com>
 <1535652965.4465.84.camel@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <CACRpkdZCXdpYXF-xj8myJOuYGk7PAZ3+UP34MP02QCgbuTT=+A@mail.gmail.com>
To: linux-snps-arc@lists.infradead.org

On Thu, Aug 30, 2018 at 8:16 PM Eugeniy Paltsev
<Eugeniy.Paltsev@synopsys.com> wrote:
> On Thu, 2018-08-30@10:43 +0200, Linus Walleij wrote:

> > > +- snps,bit-per-line: Number of bits per each gpio line (see picture).
> > > +  Array the size of "snps,ngpios"
> > > +- snps,shift: Shift (in bits) of the each GPIO field from the previous one in
> > > +  register (see picture). Array the size of "snps,ngpios"
> > > +- snps,on-val: Value should be set in corresponding field to set
> > > +  output to "1" (see picture). Array the size of "snps,ngpios"
> > > +- snps,off-val: Value should be set in corresponding field to set
> > > +  output to "0" (see picture). Array the size of "snps,ngpios"
> >
> > Move this into a lookup table in the driver instead, and match
> > the lookup table to the compatible string. The format of the
> > register is known for a certain compatible, right?
>
> Actually I really don't want to hardcode this values into lookup table as I going to use
> this driver on 3 already upstreamed platforms and at least one upcoming.
>
> They all have such CREG pseudo-'GPIOs' differently mapped with different IO lines number,
> different enable/disable value, etc...

So each of them will have their own compatible, and table entry,
so what's the problem? If they don't have their own compatible,
they should be added, because they are per definition not compatible
if they need different values into different parts of the register.

> Is it really a problem to have this values configured via device tree?

Yes because the DT maintainers do not like that we use the device
tree as a data dumping ground.

pinctrl-single.c and some other real big pin controllers are dumping
data into the device tree, but it is a dubious practice. Two wrongs
doesn't make one right.

> If we read them from DT we are able to use this generic and configurable driver to handle
> both existing and upcoming platforms without the need of patching the driver on every new
> platform upstreaming.

But you will have to patch the driver to add a new compatible for each
platform you're upstreaming anyway, so this isn't going to make things
easier.

Yours,
Linus Walleij
