Return-Path: <SRS0=RMGV=EB=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BDD4C55178
	for <linux-snps-arc@archiver.kernel.org>; Mon, 26 Oct 2020 10:17:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 863832076A
	for <linux-snps-arc@archiver.kernel.org>; Mon, 26 Oct 2020 10:17:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tXCYbbpF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 863832076A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hN0AYHPoGQrqv36lu2emSQVgy5HRSVL10AuRUTLl17E=; b=tXCYbbpFF99+sOK7G4QcWg5Gi
	otg8RDeTA9GXQER6TOMn2BsaaKeASpVLstYNtn/4Pr+b3lU8oFccsUqVFP/U8TmN9mHoPHdMG+HMj
	W9ybnAr5t5B5fp12/HH/v4W0USLekc5upLPl52zzYFw4OWIi16Yi0n4Sdp4I8drVrTQWi7CAlvyPP
	7oPi1HJN9lUA2G5Jc00D3ytXd5QDJcVMVzIM/0mckEZnHlZMZI2KSBpJFafQIS6fe07UjxGF97TMK
	+ZD+5f3rI4TxpsMRmc+U4SFB4QBheo2RxTEvwuya47xge2ZFWRojS6AM5OmGMnr1oK4DrCFMOjk0o
	KVgIHRgog==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kWzZ4-0006pa-9i; Mon, 26 Oct 2020 10:17:22 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kWzZ2-0006ow-B1; Mon, 26 Oct 2020 10:17:21 +0000
Received: from [IPv6:2a00:23c5:9900:2d00:fa7c:ed23:2f0a:448d] (unknown
 [IPv6:2a00:23c5:9900:2d00:fa7c:ed23:2f0a:448d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: obbardc)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 49C851F44F40;
 Mon, 26 Oct 2020 10:17:18 +0000 (GMT)
Subject: Re: Build regressions/improvements in v5.10-rc1
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20201026081811.3934205-1-geert@linux-m68k.org>
 <CAMuHMdXbsJPnsXg6bA_e32zJkBG1Zzqj-ja5WzHDKL0d9OcfPg@mail.gmail.com>
From: Christopher Obbard <chris.obbard@collabora.com>
Message-ID: <ed39a579-62c9-de88-3550-f21382b804a8@collabora.com>
Date: Mon, 26 Oct 2020 10:17:16 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdXbsJPnsXg6bA_e32zJkBG1Zzqj-ja5WzHDKL0d9OcfPg@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201026_061720_481392_841DA3FE 
X-CRM114-Status: GOOD (  15.01  )
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
Cc: Joe Perches <joe@perches.com>, linux-um <linux-um@lists.infradead.org>,
 arcml <linux-snps-arc@lists.infradead.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Hi Geert,

On 26/10/2020 09:48, Geert Uytterhoeven wrote:
> On Mon, Oct 26, 2020 at 10:46 AM Geert Uytterhoeven
> <geert@linux-m68k.org> wrote:
>> Below is the list of build error/warning regressions/improvements in
>> v5.10-rc1[1] compared to v5.9[2].
>>
>> Summarized:
>>    - build errors: +3/-7
>>    - build warnings: +26/-28
>>
>> Happy fixing! ;-)
>>
>> Thanks to the linux-next team for providing the build service.
>>
>> [1] http://kisskb.ellerman.id.au/kisskb/branch/linus/head/3650b228f83adda7e5ee532e2b90429c03f7b9ec/ (all 192 configs)
>> [2] http://kisskb.ellerman.id.au/kisskb/branch/linus/head/bbf5c979011a099af5dc76498918ed7df445635b/ (all 192 configs)
>>
>>
>> *** ERRORS ***
>>
>> 3 error regressions:
>>    + /kisskb/src/arch/um/kernel/skas/clone.c: error: expected declaration specifiers or '...' before string constant:  => 24:16

For me, reverting commit 33def8498fdde180023444b08e12b72a9efed41d 
("treewide: Convert macro and uses of __section(foo) to 
__section("foo")") fixed this compile error and one other introduced by 
the same patch.
Unfortunately I wasn't able to come up with a fix for that, but I have 
CC the author of that patch.

Thanks!
Christopher Obbard

> 
> um-all{mod,yes}config
> 
>>    + error: hotplug-memory.c: undefined reference to `of_drconf_to_nid_single':  => .text+0x5e0)
> 
> powerpc-gcc5/pseries_le_defconfig+NO_NUMA
> 
>>    + {standard input}: Error: inappropriate arguments for opcode 'adc':  => 170
> 
> arc-gcc10/axs101_defconfig
> 
> Gr{oetje,eeting}s,
> 
>                          Geert
> 

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
