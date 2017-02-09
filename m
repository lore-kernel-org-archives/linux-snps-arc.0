From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Thu, 9 Feb 2017 19:02:30 +0000
Subject: [PATCH] net: phy: dp83867: Fall-back to default values of clock
 delay and FIFO depth
In-Reply-To: <360cfba0-cc84-4378-025d-34e5eb1fc2c8@gmail.com>
References: <20170206192445.35829-1-abrodkin@synopsys.com>
 <20170208.131519.1313210815958231832.davem@davemloft.net>
 <360cfba0-cc84-4378-025d-34e5eb1fc2c8@gmail.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1486666949.2726.99.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Florian,

On Wed, 2017-02-08@10:20 -0800, Florian Fainelli wrote:
> On 02/08/2017 10:15 AM, David Miller wrote:
> > 
> > From: Alexey Brodkin <Alexey.Brodkin at synopsys.com>
> > Date: Mon,??6 Feb 2017 22:24:45 +0300
> > 
> > > 
> > > Given there're default values mentioned in the PHY datasheet
> > > fall-back gracefully to them instead of silently return an error
> > > through the whole call-chain.
> > > 
> > > This allows to use minimalistic description in DT if no special
> > > features are required.
> > > 
> > > Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
> > 
> > If these defaults are legitimate to use, then you should probably also
> > set them in the non-CONFIG_OF_MDIO case implementation of
> > dp83867_of_init().
> 
> IIRC this is what Alexey is doing already, in case of errors, instead of
> returning the error code, he changes the default values and does not
> propagate the error code.
> 
> Alexey, you are essentially making dp83867_of_init() impossible to fail
> (or nearly) now, even with invalid properties, so I agree with David
> here, you should probably have a function that runs after
> dp83867_of_init() whose job is to set default values, if none have been
> previously set through Device Tree.

But why do we need to return error code from?dp83867_of_init()?
The point is this function doesn't do any hardware setup as well,
in fact it doesn't even reads anything from real hardware.

So we may indeed report an error to above callers (which is not super convenient
because the error comes many levels above without any error message making
understanding of the failure pretty complicated - go trace where it came from)
but what would it mean to a user? What do we want our user to do?
Set at least something in required properties? Then why don't we do that ourselves
right in the driver? Moreover since we're talking about defaults mentioned by
the PHY manufacturer we will just use "factory settings". Still allowing others to
override defaults with their .dts.

I agree with David that it really worth to do the same settings for non_CONFIG_OF_MDIO
case.

-Alexey
