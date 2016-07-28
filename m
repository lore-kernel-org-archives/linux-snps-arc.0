From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Thu, 28 Jul 2016 15:40:30 -0700
Subject: [PATCH 0/2] ARC Moving to @pcl relocations
In-Reply-To: <A3C16EF4-41C6-4E69-B8E7-6B2DEC457064@gmail.com>
References: <cover.1469729044.git.andrew.burgess@embecosm.com>
 <16492d6d-b4d4-39af-18dd-15f78c1abeff@synopsys.com>
 <A3C16EF4-41C6-4E69-B8E7-6B2DEC457064@gmail.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1e046cfd-bf55-c1fa-6083-6bd7acf0f705@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 07/28/2016 03:04 PM, Bernhard Reutner-Fischer wrote:
>> Indeed your 2/2 seems to be the most "past-proof" code change. So I
>> >would think it
>> >is indeed better and is something I should have done in the first
>> >place.
>> >
>> >@Alexey, @Vlad what say you ?
> uClibc traditionally supports the current stable release of binutils, which would make it patch #1 I think.
> 

But 2/2 works for both and makes actual binutils version moot. FWIW, ARC tools
don't as of last release didn't use the upstream/stable binutils, but we are
pretty close to that now though.

Thx,
-Vineet
