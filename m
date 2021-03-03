Return-Path: <SRS0=6MfY=IC=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C251CC4332D
	for <linux-snps-arc@archiver.kernel.org>; Thu,  4 Mar 2021 00:51:18 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1689264FC9
	for <linux-snps-arc@archiver.kernel.org>; Thu,  4 Mar 2021 00:51:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1689264FC9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=subdivi.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7GjqbbHxeFJoq3fG49ebO89GXI+NWxbol/p3j0pyfUk=; b=qpyUKP0VfkcEu+c2h3svXzf0L
	0UyP+Jor4mmhp4BR00BTxWJFSxYjxWgcbiN/HJysFXrwyMK7xhVTb5yqmko2NkmykrVRLQbHPIpiw
	+aYregT+9XDBmtAUyzF6yR5PdgfsYi2JNjvEMjYoYPMY0dlQfU0usvZaVCuU3R2YSXf8vUeOMHE3Z
	6PxbVBqzm+9Bygoiu0F76kHeViIqLvnNP8CWaJjrGhURfdKV3fOJpCygnBL0QPBMmAh6LehCDCEa6
	8AxTxjQ2oBuAop+Ok4P0kZLV4p0cqkJXVc792Sg2RyKiMuwM82l08MQ8JtIvZcEss25YywTvREmo5
	M1cj172Xw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHcCy-007Eg7-GF; Thu, 04 Mar 2021 00:51:16 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHXa7-006JO0-SG
 for linux-snps-arc@desiato.infradead.org; Wed, 03 Mar 2021 19:54:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=4542s/kipIh7PSix5HCMdFJdbc8OB/2qmEgynMCNv7Y=; b=permPFzxVgifawwV2j68ereLqu
 wppzFcy0D3Z8ZcDsTX7mnG+RDZspbNHADy+RV/nfhP5DVUiKseDp2vdVr+KdtJV+2MaVxa64F3NJm
 FkKU1OkCG8BAz+sh1DucsdlKYOePhgb9cqedvtm2NjKzwomqGQtyYQcynskrFgZywQ94kFXM4EdA5
 b8KXlcSczZhRzBtSXHlSShgD5WX9NX/wimE+OmZCjglnY61xFREF+9yVOvw0jvFoLtBYx4SSM6+7+
 px+RYrT4MbYzVN0qPNhPeRvbQJ1rBBwao+0ZnYawsLTfBXXpWoUD//r8sPAEMQ+/f23fZ1ewxGk0A
 bk99cdvA==;
Received: from isilmar-4.linta.de ([136.243.71.142])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHXZx-003z4v-LN
 for linux-snps-arc@lists.infradead.org; Wed, 03 Mar 2021 19:54:43 +0000
Received: from isilmar-4.linta.de (isilmar.linta [10.0.0.1])
 by isilmar-4.linta.de (Postfix) with ESMTP id AE45B201227;
 Wed,  3 Mar 2021 19:54:31 +0000 (UTC)
Date: Wed, 3 Mar 2021 20:54:14 +0100
From: Helmut Grohne <helmut@subdivi.de>
To: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Cc: Guillem Jover <guillem@debian.org>,
 linux-snps-arc <linux-snps-arc@lists.infradead.org>,
 Vineet Gupta <Vineet.Gupta1@synopsys.com>,
 "980963@bugs.debian.org" <980963@bugs.debian.org>
Subject: Re: Bug#980963: dpkg: Please add ARC architecture
Message-ID: <YD/pZvNkKBSW53Xu@alf.mars>
Mail-Followup-To: Helmut Grohne <helmut@subdivi.de>,
 Alexey Brodkin <Alexey.Brodkin@synopsys.com>,
 Guillem Jover <guillem@debian.org>,
 linux-snps-arc <linux-snps-arc@lists.infradead.org>,
 Vineet Gupta <Vineet.Gupta1@synopsys.com>,
 "980963@bugs.debian.org" <980963@bugs.debian.org>
References: <161152061283.11410.4872085138884291562.reportbug@abrodkin-5550.internal.synopsys.com>
 <BN8PR12MB333028A46C2A7A80690DDB76A1B19@BN8PR12MB3330.namprd12.prod.outlook.com>
 <YD/PtMrNdGYmBY3/@alf.mars>
 <BN8PR12MB3330A43C8C7E626A24813DF2A1989@BN8PR12MB3330.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <BN8PR12MB3330A43C8C7E626A24813DF2A1989@BN8PR12MB3330.namprd12.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210303_195443_507445_23030CE3 
X-CRM114-Status: GOOD (  11.69  )
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

Hi Alexey,

On Wed, Mar 03, 2021 at 07:35:39PM +0000, Alexey Brodkin wrote:
> Well not sure why there's a dependency on glibc as w/o ARC target support
> in dpkg nothing could be built for ARC. For example I did built Binutils
> with fixed dpkg.

There is no hard dependency in that direction. Just pushback on adding
lots of Debian architectures that never really take off. For instance,
or1k was never fully bootstrapped. It'll be merged. Just not now. (Not
speaking as a dpkg maintainer here, just telling what will happen from
experience.)

> > Things that often need architecture-specific support for a new
> > architecture include:
> >  * guile-X.Y (cross support)
> >  * libgc
> 
> Above 2 are not [yet] supported but seems to be easy ones.

guile-X.Y is quite mechanical, yes. libgc can be a little more
difficult.

> >  * libxcrypt (symbols)
> 
> Not sure about "libxcrypt" (whatver that means), but libgpg-error supports ARC since 2018, see:

https://tracker.debian.org/pkg/libxcrypt

> https://github.com/gpg/libgpg-error/commit/48c8f8ddfc80551db7615e1eb3555c1dc3f6a657

This should be unneeded. libgpg-error now defaults to
force_use_syscfg=no and no longer needs arch-specific changes.

> >  * nspr
> 
> Done in 2019, see https://hg.mozilla.org/projects/nspr/rev/cc73b6c7dab2e8053533e1f2c0c23dc721e10b76

Great.

> >  * openssl (packaging)
> 
> Not sure what needs to be done here as I know we build a lot of complex
> things with OpenEmbedded/Yocto and openssl libs are being built for sure.

https://sources.debian.org/src/openssl/1.1.1j-1/debian/patches/debian-targets.patch/

> > Are any of these fixed or confirmed working for arc?
> 
> See above, quite some do work.

Impressive. Some work is left. What also is left is demonstrating that
it actually works. It seems that Vineet is working on integrating it.

Helmut


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
