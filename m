Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E557DC4332F
	for <linux-snps-arc@archiver.kernel.org>; Wed, 15 Dec 2021 08:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x0GvhzfcaXm2kOWlSh0PaiN8MNGjs9pBpP1X/31MLYk=; b=HrqGX2liXOd/+x
	rOcWglN97iI2wRWO8MOGZuJNoAll1fFoK8WkFJYLrZjYN8JCePM/oiV1aIb+Bk20B2fkqApgHWC77
	J8DgCAKDonyUZv4lEdUXh4ikWTNeJfnI4TbLDdQa4aiajPwE+XsQKmO/8hmDiXwk2QzqZtikpRCFU
	m6MPqMbBqOhJvvrabqi5qMfLYpbqOwfBA3tE9eEdLIRp2AsDSKrhvcinrL04knTsIbZIAhvIZ54/u
	a/yj76jMmqEahpk7SmY3OLrUl060e4yPMOUFFDLY5do4IwrQU7GgorbObZamHZGwis8zV0gZ3EAu7
	K6uMocdiIJoUERhXkoJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxPqW-00HMgP-8f; Wed, 15 Dec 2021 08:41:08 +0000
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.85.151])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxPqS-00HMde-4x
 for linux-snps-arc@lists.infradead.org; Wed, 15 Dec 2021 08:41:06 +0000
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-23-f8sISgTNNZG0D9h8G8bq7w-1; Wed, 15 Dec 2021 08:40:15 +0000
X-MC-Unique: f8sISgTNNZG0D9h8G8bq7w-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.26; Wed, 15 Dec 2021 08:40:11 +0000
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.026; Wed, 15 Dec 2021 08:40:11 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Yury Norov' <yury.norov@gmail.com>, =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?=
 <mirq-linux@rere.qmqm.pl>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "James E.J.
 Bottomley" <jejb@linux.ibm.com>, "Martin K. Petersen"
 <martin.petersen@oracle.com>, "Paul E. McKenney" <paulmck@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Alexander Shishkin
 <alexander.shishkin@linux.intel.com>, Alexey Klimov <aklimov@redhat.com>,
 Amitkumar Karwar <amitkarwar@gmail.com>, Andi Kleen <ak@linux.intel.com>,
 Andrew Lunn <andrew@lunn.ch>, Andrew Morton <akpm@linux-foundation.org>, Andy
 Gross <agross@kernel.org>, Andy Lutomirski <luto@kernel.org>, "Andy
 Shevchenko" <andy@infradead.org>, Anup Patel <anup.patel@wdc.com>, "Ard
 Biesheuvel" <ardb@kernel.org>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Borislav Petkov <bp@alien8.de>, "Catalin
 Marinas" <catalin.marinas@arm.com>, Christoph Hellwig <hch@lst.de>,
 "Christoph Lameter" <cl@linux.com>, Daniel Vetter <daniel@ffwll.ch>, Dave
 Hansen <dave.hansen@linux.intel.com>, David Airlie <airlied@linux.ie>, Dennis
 Zhou <dennis@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>, Geetha sowjanya
 <gakula@marvell.com>, Geert Uytterhoeven <geert@linux-m68k.org>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, Guo Ren <guoren@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>, Heiko Carstens <hca@linux.ibm.com>, Ian
 Rogers <irogers@google.com>, Ingo Molnar <mingo@redhat.com>, "Jakub Kicinski"
 <kuba@kernel.org>, Jason Wessel <jason.wessel@windriver.com>, "Jens Axboe"
 <axboe@fb.com>, Jiri Olsa <jolsa@redhat.com>, Jonathan Cameron
 <jic23@kernel.org>, Juri Lelli <juri.lelli@redhat.com>, Kalle Valo
 <kvalo@codeaurora.org>, Kees Cook <keescook@chromium.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski@canonical.com>, Lee Jones
 <lee.jones@linaro.org>, Marc Zyngier <maz@kernel.org>, Marcin Wojtas
 <mw@semihalf.com>, Mark Gross <markgross@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>, Matti Vaittinen <mazziesaccount@gmail.com>, "Mauro
 Carvalho Chehab" <mchehab@kernel.org>, Mel Gorman <mgorman@suse.de>, "Michael
 Ellerman" <mpe@ellerman.id.au>, Mike Marciniszyn
 <mike.marciniszyn@cornelisnetworks.com>, Nicholas Piggin <npiggin@gmail.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Peter Zijlstra <peterz@infradead.org>,
 Petr Mladek <pmladek@suse.com>, Randy Dunlap <rdunlap@infradead.org>, "Rasmus
 Villemoes" <linux@rasmusvillemoes.dk>, Roy Pledge <Roy.Pledge@nxp.com>,
 Russell King <linux@armlinux.org.uk>, Saeed Mahameed <saeedm@nvidia.com>,
 Sagi Grimberg <sagi@grimberg.me>, Sergey Senozhatsky
 <senozhatsky@chromium.org>, Solomon Peachy <pizza@shaftnet.org>, Stephen Boyd
 <sboyd@kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Steven Rostedt
 <rostedt@goodmis.org>, Subbaraya Sundeep <sbhatta@marvell.com>, Sudeep Holla
 <sudeep.holla@arm.com>, Sunil Goutham <sgoutham@marvell.com>, Tariq Toukan
 <tariqt@nvidia.com>, Tejun Heo <tj@kernel.org>, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>, Thomas Gleixner <tglx@linutronix.de>, "Ulf
 Hansson" <ulf.hansson@linaro.org>, Vincent Guittot
 <vincent.guittot@linaro.org>, Vineet Gupta <vgupta@kernel.org>, Viresh Kumar
 <viresh.kumar@linaro.org>, Vivien Didelot <vivien.didelot@gmail.com>,
 Vlastimil Babka <vbabka@suse.cz>, Will Deacon <will@kernel.org>,
 "bcm-kernel-feedback-list@broadcom.com"
 <bcm-kernel-feedback-list@broadcom.com>, "kvm@vger.kernel.org"
 <kvm@vger.kernel.org>, "linux-alpha@vger.kernel.org"
 <linux-alpha@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-crypto@vger.kernel.org"
 <linux-crypto@vger.kernel.org>, "linux-csky@vger.kernel.org"
 <linux-csky@vger.kernel.org>, "linux-ia64@vger.kernel.org"
 <linux-ia64@vger.kernel.org>, "linux-mips@vger.kernel.org"
 <linux-mips@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "linux-perf-users@vger.kernel.org" <linux-perf-users@vger.kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Subject: RE: [PATCH 2/9] lib/bitmap: implement bitmap_{empty,full} with
 bitmap_weight_eq()
Thread-Topic: [PATCH 2/9] lib/bitmap: implement bitmap_{empty,full} with
 bitmap_weight_eq()
Thread-Index: AQHX8SLbxx6fx2pSKEyBSY04FwbBf6wzO5+g
Date: Wed, 15 Dec 2021 08:40:10 +0000
Message-ID: <0ccb827de1164b2989d652bfb6f1bbab@AcuMS.aculab.com>
References: <20211128035704.270739-1-yury.norov@gmail.com>
 <20211128035704.270739-3-yury.norov@gmail.com>
 <YaPGDOvBzhiRFcOP@qmqm.qmqm.pl>
 <CAAH8bW9-dbENFUrwPUQ-uJVVX_s=PWb2zpAJ8BqkV3vJE696mA@mail.gmail.com>
In-Reply-To: <CAAH8bW9-dbENFUrwPUQ-uJVVX_s=PWb2zpAJ8BqkV3vJE696mA@mail.gmail.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=C51A453 smtp.mailfrom=david.laight@aculab.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211215_004104_519510_BA0397D5 
X-CRM114-Status: GOOD (  13.41  )
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

From: Yury Norov
> Sent: 14 December 2021 19:43
...
> 
> I think that for long bitmaps the most time consuming operation is moving
> data to L1, and for short bitmaps the difference between approaches is
> barely measurable.
> 
> But hweght_long on each iteration can't be more effective than the current
> version. So, I'll drop this patch for v2 and keep things unchanged.

Actually do bitmap_full/empty() calls make any sense at all?
The result is stale since bitmaps are designed to do locked operations.
If you have a lock covering the bitmap then you should be using
something that uses non-locked accesses.
Rightly or wrongly that isn't the bitmap api.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
