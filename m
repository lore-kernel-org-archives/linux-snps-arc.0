Return-Path: <SRS0=Sdks=DV=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DA05C2BD10
	for <linux-snps-arc@archiver.kernel.org>; Wed, 14 Oct 2020 20:04:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 96F7221D81
	for <linux-snps-arc@archiver.kernel.org>; Wed, 14 Oct 2020 20:04:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZNRAMG64";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="wQTHKKiL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 96F7221D81
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5c6jOIfsg2/LQ4lp5Q7rJKyVZJvAKxIvglWx9tuYf64=; b=ZNRAMG64OA5IKG7SmqyYYvSfW
	W5pspnkFLLbl18SdMqJwF8gPCa7J8AlcwfnTTApAV4Zw/PIJXy5Pw1hcHoHnDkA8u+mDghJXiisi2
	fZ58rruXDH4hZlVGSjD/8ldtkosUAiyhtMVvOPn/N9iIr4THhnGRQKMVAv7t4m9zPPqcGs7W1lK3K
	PF3Hunn++EtTQD8BHKa/TuPycqqVqYrRleIEAIGTJsJF6ztQUEMRZEcIXdP13S8veDAzAIM1kdBDZ
	4bHN8sbtBjoFeJ7sDVNrOoWmjZ9xT3RaNus6WLsP1qxS/vfQBzE7fCwXmeeXy724brED9ZmX3TE5p
	0tZKDuKeA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kSn14-0006j5-SZ; Wed, 14 Oct 2020 20:04:54 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kSn10-0006i1-VE; Wed, 14 Oct 2020 20:04:52 +0000
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 280F62222C;
 Wed, 14 Oct 2020 20:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602705888;
 bh=LVOA0j+MJzgYyCN7dHdR7NmraU1ox1hHg7M0Urqt4NQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=wQTHKKiLYe1M5Blf9UnIF93aztV1JW1njnZETaZAa2XC24vgNAP+mN26lKYelXhoh
 q5j80VfRYAChPnXhReDLzb5ly5CRPNwVQbc/4pqym603j5MRW4WEpx9NokJOvmE0hj
 HXRlFHuOOLPs+/GCoJnaipjSwPz1Wq0p7dKneDxs=
Received: by mail-ej1-f45.google.com with SMTP id t25so243747ejd.13;
 Wed, 14 Oct 2020 13:04:48 -0700 (PDT)
X-Gm-Message-State: AOAM532C26zar/iEye9Aa+RjL3Dj26L6wwDbDgXIM1KIME3AfmByC5Eo
 0vuySf8VZtTF30jE2M6O7H0kIiVnFy6Xoeo5UQQ=
X-Google-Smtp-Source: ABdhPJxVq3w8qwB1G2N0D+UtcPF/q2rwCY1+hYhPGeOH++72c0hWMPUiD7UtIVAxB9zCJY3TiBFQxtZbAMhKQvSsc6Q=
X-Received: by 2002:a17:906:14db:: with SMTP id
 y27mr845925ejc.148.1602705886392; 
 Wed, 14 Oct 2020 13:04:46 -0700 (PDT)
MIME-Version: 1.0
References: <20201014101402.18271-1-Sergey.Semin@baikalelectronics.ru>
 <20201014101402.18271-21-Sergey.Semin@baikalelectronics.ru>
 <CAJKOXPeErocR5-3xCDqBR3-k3w_2EQ_768d71n229cbzeo4TtQ@mail.gmail.com>
 <20201014171640.bup52mgaz4jvhtsy@mobilestation>
In-Reply-To: <20201014171640.bup52mgaz4jvhtsy@mobilestation>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Wed, 14 Oct 2020 22:04:32 +0200
X-Gmail-Original-Message-ID: <CAJKOXPcHi_=jea=0YrPNo4dh6k03+63Tc2Uo+sd0u8+XPdQjOw@mail.gmail.com>
Message-ID: <CAJKOXPcHi_=jea=0YrPNo4dh6k03+63Tc2Uo+sd0u8+XPdQjOw@mail.gmail.com>
Subject: Re: [PATCH 20/20] arch: dts: Fix DWC USB3 DT nodes name
To: Serge Semin <Sergey.Semin@baikalelectronics.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201014_160451_243531_1601718C 
X-CRM114-Status: GOOD (  43.01  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, linux-usb@vger.kernel.org,
 Neil Armstrong <narmstrong@baylibre.com>, Tony Lindgren <tony@atomide.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
 "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Gregory Clement <gregory.clement@bootlin.com>, Wei Xu <xuwei5@hisilicon.com>,
 Chen-Yu Tsai <wens@csie.org>, Kukjin Kim <kgene@kernel.org>,
 Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-snps-arc@lists.infradead.org,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 devicetree@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>,
 Mathias Nyman <mathias.nyman@intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Maxime Ripard <mripard@kernel.org>,
 Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
 Rob Herring <robh+dt@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Roger Quadros <rogerq@ti.com>, Felipe Balbi <balbi@kernel.org>,
 linux-mips@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 linuxppc-dev@lists.ozlabs.org, Patrice Chotard <patrice.chotard@st.com>,
 Serge Semin <fancer.lancer@gmail.com>, Li Yang <leoyang.li@nxp.com>,
 Manu Gautam <mgautam@codeaurora.org>,
 =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
 Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Wed, 14 Oct 2020 at 19:16, Serge Semin
<Sergey.Semin@baikalelectronics.ru> wrote:
>
> On Wed, Oct 14, 2020 at 12:33:25PM +0200, Krzysztof Kozlowski wrote:
> > On Wed, 14 Oct 2020 at 12:23, Serge Semin
> > <Sergey.Semin@baikalelectronics.ru> wrote:
> > >
> > > In accordance with the DWC USB3 bindings the corresponding node name is
> > > suppose to comply with Generic USB HCD DT schema, which requires the USB
> > > nodes to have the name acceptable by the regexp: "^usb(@.*)?" . But a lot
> > > of the DWC USB3-compatible nodes defined in the ARM/ARM64 DTS files have
> > > name as "^dwc3@.*" or "^usb[1-3]@.*" or even "^dwusb@.*", which will cause
> > > the dtbs_check procedure failure. Let's fix the nodes naming to be
> > > compatible with the DWC USB3 DT schema to make dtbs_check happy.
> > >
> > > Note we don't change the DWC USB3-compatible nodes names of
> > > arch/arm64/boot/dts/apm/{apm-storm.dtsi,apm-shadowcat.dtsi} since the
> > > in-source comment says that the nodes name need to be preserved as
> > > "^dwusb@.*" for some backward compatibility.
> > >
> > > Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> > >
> > > ---
> > >
> > > Please, test the patch out to make sure it doesn't brake the dependent DTS
> > > files. I did only a manual grepping of the possible nodes dependencies.
> >
>
> > 1. It is you who should compare the decompiled DTS, not us. For example:
> > $ for i in dts-old/*/*dtb dts-old/*/*/*dtb; do echo $i; crosc64
> > scripts/dtc/dtx_diff ${i} dts-new/${i#dts-old/} ; done
> >
> > $ for i in dts-old/*/*dtb dts-old/*/*/*dtb; do echo $i; crosc64
> > fdtdump ${i} > ${i}.fdt ; crosc64 fdtdump dts-new/${i#dts-old/} >
> > dts-new/${i#dts-old/}.fdt ; diff -ubB ${i}.fdt
> > dts-new/${i#dts-old/}.fdt ; done
>
> So basically you suggest first to compile the old and new dts files, then to
> de-compile them, then diff old and new fdt's, and visually compare the results.
> Personally it isn't that much better than what I did, since each old and new
> dtbs will for sure differ due to the node names change suggested in this patch.
> So it will lead to the visual debugging too, which isn't that effective. But
> your approach is still more demonstrative to make sure that I didn't loose any
> nodes redefinition, since in the occasion the old and new de-compiled nodes will
> differ not only by the node names but with an additional old named node.

My suggestion is to compare the entire, effective DTS after all
inclusions. Maybe you did it already, I don't know. The point is that
when you change node names in DTSI but you miss one in DTS, you end up
with two nodes. This is much easier to spot with dtxdiff or with
fdtdump (which behaves better for node moves).

Indeed it is still a visual comparison - if you have any ideas how to
automate it (e.g. ignore phandle changes), please share. It would
solve my testings as well. But asking others to test because you do
not want to check it is not the best way to handle such changes.

>
> So to speak thanks for suggesting it. I'll try it to validate the proposed
> changes.
>
> Two questions:
> 1) Any advise of a good inliner/command to compile all dtbs at once? Of course I
> can get all the updated dtsi'es, then find out all the dts'es which include
> them, then directly use dtc to compile the found dts'es... On the other hand I
> can just compile all dts'es, then compare old and new ones. The diff of the
> non-modified dtb'es will be just empty...

make dtbs
touch your dts or git stash pop
make dtbs
compare
diff for all unchanged will be simply empty, so easy to spot

> 2) What crosc64 is?

Ah, just an alias for cross compiling + ccache + kbuild out. I just
copied you my helpers, so you need to tweak them.

>
> >
> > 2. Split it per arm architectures (and proper subject prefix - not
> > "arch") and subarchitectures so maintainers can pick it up.
>
> Why? The changes are simple and can be formatted as a single patch. I've seen
> tons of patches submitted like that, accepted and then merged. What you suggest
> is just much more work, which I don't see quite required.

DTS changes go separate between arm64 and arm. There is nothing
unusual here - all changes are submitted like this.
Second topic is to split by subarchitectures which is necessary if you
want it to be picked up by maintainers. It also makes it easier to
review. Sure, without split ber subarchitectures this could be picked
up by SoC folks but you did not even CC them. So if you do not want to
split it per subarchitectures for maintainers and you do not CC SoC,
then how do you believe this should be picked up? Out of the regular
patch submission way? That's not how the changes are handled.

>
> >
> > 3. The subject title could be more accurate - there is no fix here
> > because there was no errors in the first place. Requirement of DWC
> > node names comes recently, so it is more alignment with dtschema.
> > Otherwise automatic-pickup-stable-bot might want to pick up... and it
> > should not go to stable.
>
> Actually it is a fix, because the USB DT nodes should have been named with "usb"
> prefix in the first place. Legacy DWC USB3 bindings didn't define the nodes
> naming, but implied to be "usb"-prefixed by the USB HCD schema. The Qualcomm
> DWC3 schema should have defined the sub-nodes as "dwc3@"-prefixed, which was
> wrong in the first place.

Not following the naming convention of DT spec which was loosely
enforced is not an error which should be "fixed". Simply wrong title.
This is an alignment with dtschema or correcting naming convention.
Not fixing errors.

>
> Regarding automatic-pickup-stable-bot if it exists I don't think it scans all the
> emails, but most likely the stable@vger.kernel.org list only or the emails
> having the "Fixes:" tag. If I am wrong please give me a link to the bot sources
> or refer to a doc where I can read about the way it works, to take it into
> account in future commits. Just to note I submitted patches which did some fixes,
> had the word "fix" in the subject but weren't selected to be backported to the
> stable kernel.

You mixed up bots. The regular stable bot picks commits with cc-stable
or with "Fixes". The auto-pickup bot picks all commits (not emails...
why would it look at emails?) looking like a fix. Wording could be one
of the hints used in the heuristic. Anyway, this is not a fix,
regardless of autosel, so the wording is not correct.

Just Google for AUTOSEL. You can then ask Sasha for sources...

> Anyway I don't really care that much about the subject text using the word "fix"
> or some else. So if you suggest some better alternative, I'd be glad to consider
> it.

I already did. One example is: alignment with dtschema.

Best regards,
Krzysztof

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
