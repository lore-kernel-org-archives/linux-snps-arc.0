From: f.fainelli@gmail.com (Florian Fainelli)
Date: Wed, 8 Feb 2017 10:20:00 -0800
Subject: [PATCH] net: phy: dp83867: Fall-back to default values of clock
 delay and FIFO depth
In-Reply-To: <20170208.131519.1313210815958231832.davem@davemloft.net>
References: <20170206192445.35829-1-abrodkin@synopsys.com>
 <20170208.131519.1313210815958231832.davem@davemloft.net>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <360cfba0-cc84-4378-025d-34e5eb1fc2c8@gmail.com>
To: linux-snps-arc@lists.infradead.org

On 02/08/2017 10:15 AM, David Miller wrote:
> From: Alexey Brodkin <Alexey.Brodkin at synopsys.com>
> Date: Mon,  6 Feb 2017 22:24:45 +0300
> 
>> Given there're default values mentioned in the PHY datasheet
>> fall-back gracefully to them instead of silently return an error
>> through the whole call-chain.
>>
>> This allows to use minimalistic description in DT if no special
>> features are required.
>>
>> Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
> 
> If these defaults are legitimate to use, then you should probably also
> set them in the non-CONFIG_OF_MDIO case implementation of
> dp83867_of_init().

IIRC this is what Alexey is doing already, in case of errors, instead of
returning the error code, he changes the default values and does not
propagate the error code.

Alexey, you are essentially making dp83867_of_init() impossible to fail
(or nearly) now, even with invalid properties, so I agree with David
here, you should probably have a function that runs after
dp83867_of_init() whose job is to set default values, if none have been
previously set through Device Tree.

> 
> But I'd like to see feedback and reviews from other PHY area experts
> before I even consider that updated version of this change.
> 
> Thanks.
> 


-- 
Florian
