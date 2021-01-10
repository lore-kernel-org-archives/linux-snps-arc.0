Return-Path: <SRS0=zu6R=GN=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05DB9C433DB
	for <linux-snps-arc@archiver.kernel.org>; Sun, 10 Jan 2021 11:58:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7614B238E5
	for <linux-snps-arc@archiver.kernel.org>; Sun, 10 Jan 2021 11:58:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7614B238E5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=goldelico.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:References:Message-Id:Date:In-Reply-To:From:
	Mime-Version:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=AgF57AhX74Fv8HT81khhJqXmLwbqvIkgwJKjYMsUfAs=; b=b3ZwcVOWkT3ozBJbezd+RwLQP
	+2YCbMUJVyk+o9Xb8J4ARni57Pi1K2cUTXKRI09YQ9cCCdAykbbXkNP0RQ7Aofgl+oy4TEaNzC4Cw
	D8QZsGehrB858qw4v9U6LWoS88cUu9Kzq0P3QuLcmZkgS6shbNXgPAnSQXRHXJD/VX7xeoWExMn0d
	HMeugpRw2RqsYtAxOZlfE/aubuwQW+HYoCRGRaifsAaodFgt1KttpUv6e8RbZDQemasiQEc6tbbbM
	X+NUWQp/e46kxoK/tTIFWmJs9MVu2DywGlGxQ14Zdz06+ytJdZ4D7Ibily8plVY9hhBWIU7pp3UXr
	SXRbwZmvQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kyZMk-00047F-Qa; Sun, 10 Jan 2021 11:58:38 +0000
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.82])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kyZMg-00045A-FI; Sun, 10 Jan 2021 11:58:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1610279913;
 s=strato-dkim-0002; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:From:
 Subject:Sender;
 bh=suxnFiUZXehwYdxu3HHH3yerlSomJchhrhNdK2IYwzY=;
 b=giM5Xggn1Qh3luHHcyFrTfPGNn8w2hR219RGfGwulQl1lHsbGiWJWDy+aOle16AqP4
 ZnCSrCkWgKEaMS51/bxmPIExjzOanP2+/sXgza/O3vzsFChjiWbWVhRX7rZo3gWZGpYg
 lnuLhmVP/u0XZn7lwup1JDUkUiS3YHg6E7YVmVg3cL/O4+4znFjEsmBaUCPLArlNSGg3
 jXCH78XhIcSX6AmdIZ9iesoeFkqwSmlAKUbWVVDOx+v3TzjMepKgOHH25kDQXV8ytTzi
 c1hrNHMzDF11WFhbJ5WpsCsQmsEzdXTtrShknF+1hqRtb01kiySp8Z9P7Rr8Qw+r3+40
 a47w==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7wpz8NMGHPrrwDOsPyQ="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box by smtp.strato.de (RZmta 47.12.1 DYNA|AUTH)
 with ESMTPSA id m056b3x0ABrBL8P
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256
 ECDH bits, eq. 3072 bits RSA))
 (Client did not present a certificate);
 Sun, 10 Jan 2021 12:53:11 +0100 (CET)
Subject: Re: [patch V3 13/37] mips/mm/highmem: Switch to generic kmap atomic
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <DUUPMQ.U53A0W7YJPGM@crapouillou.net>
Date: Sun, 10 Jan 2021 12:53:10 +0100
Message-Id: <6B074439-2E91-4FCF-84C8-82AE13D8C7F0@goldelico.com>
References: <JUTMMQ.NNFWKIUV7UUJ1@crapouillou.net>
 <20210108235805.GA17543@alpha.franken.de>
 <20210109003352.GA18102@alpha.franken.de>
 <DUUPMQ.U53A0W7YJPGM@crapouillou.net>
To: Paul Cercueil <paul@crapouillou.net>
X-Mailer: Apple Mail (2.3124)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210110_065834_679086_9311F789 
X-CRM114-Status: GOOD (  13.41  )
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Cc: juri.lelli@redhat.com, linux-aio@kvack.org, airlied@linux.ie,
 nouveau@lists.freedesktop.org, bigeasy@linutronix.de,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 linux-mips <linux-mips@vger.kernel.org>, bsegall@google.com, clm@fb.com,
 ray.huang@amd.com, paulus@samba.org, kraxel@redhat.com,
 sparclinux@vger.kernel.org, deanbo422@gmail.com, hch@lst.de,
 vincent.guittot@linaro.org, paulmck@kernel.org, mpe@ellerman.id.au,
 x86@kernel.org, linux@armlinux.org.uk, linux-csky@vger.kernel.org,
 mingo@kernel.org, peterz@infradead.org, linux-graphics-maintainer@vmware.com,
 bskeggs@redhat.com, airlied@redhat.com, linux-snps-arc@lists.infradead.org,
 linux-mm@kvack.org, mgorman@suse.de, linux-xtensa@linux-xtensa.org,
 arnd@arndb.de, intel-gfx@lists.freedesktop.org, sroland@vmware.com,
 josef@toxicpanda.com, rostedt@goodmis.org, torvalds@linuxfoundation.org,
 green.hu@gmail.com, rodrigo.vivi@intel.com, dsterba@suse.com,
 tglx@linutronix.de, virtualization@lists.linux-foundation.org,
 dietmar.eggemann@arm.com,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, chris@zankel.net,
 monstr@monstr.eu, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 nickhu@andestech.com, jcmvbkbc@gmail.com, linuxppc-dev@lists.ozlabs.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 christian.koenig@amd.com, bcrl@kvack.org, spice-devel@lists.freedesktop.org,
 vgupta@synopsys.com, linux-fsdevel@vger.kernel.org, akpm@linux-foundation.org,
 bristot@redhat.com, davem@davemloft.net, linux-btrfs@vger.kernel.org,
 viro@zeniv.linux.org.uk
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org


> Am 10.01.2021 um 12:35 schrieb Paul Cercueil <paul@crapouillou.net>:
> =

> Hi Thomas,
> =

> Le sam. 9 janv. 2021 =E0 1:33, Thomas Bogendoerfer <tsbogend@alpha.franke=
n.de> a =E9crit :
>> On Sat, Jan 09, 2021 at 12:58:05AM +0100, Thomas Bogendoerfer wrote:
>>> On Fri, Jan 08, 2021 at 08:20:43PM +0000, Paul Cercueil wrote:
>>> > Hi Thomas,
>>> >
>>> > 5.11 does not boot anymore on Ingenic SoCs, I bisected it to this com=
mit.

Just for completeness, I have no such problems booting CI20/jz4780 or Skyto=
ne400/jz4730 (unpublished work) with 5.11-rc2.
But may depend on board capabilites (ram size, memory layout or something e=
lse).

>>> >
>>> > Any idea what could be happening?
>>> not yet, kernel crash log of a Malta QEMU is below.
>> update:
>> This dirty hack lets the Malta QEMU boot again:
>> diff --git a/mm/highmem.c b/mm/highmem.c
>> index c3a9ea7875ef..190cdda1149d 100644
>> --- a/mm/highmem.c
>> +++ b/mm/highmem.c
>> @@ -515,7 +515,7 @@ void *__kmap_local_pfn_prot(unsigned long pfn, pgpro=
t_t prot)
>> 	vaddr =3D __fix_to_virt(FIX_KMAP_BEGIN + idx);
>> 	BUG_ON(!pte_none(*(kmap_pte - idx)));
>> 	pteval =3D pfn_pte(pfn, prot);
>> -	set_pte_at(&init_mm, vaddr, kmap_pte - idx, pteval);
>> +	set_pte(kmap_pte - idx, pteval);
>> 	arch_kmap_local_post_map(vaddr, pteval);
>> 	current->kmap_ctrl.pteval[kmap_local_idx()] =3D pteval;
>> 	preempt_enable();
>> set_pte_at() tries to update cache and could do an kmap_atomic() there.
>> Not sure, if this is allowed at this point.
> =

> Yes, I can confirm that your workaround works here too.
> =

> Cheers,
> -Paul
> =

> =



_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
