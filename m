Return-Path: <SRS0=Jklj=IQ=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D07C8C433DB
	for <linux-snps-arc@archiver.kernel.org>; Thu, 18 Mar 2021 01:03:24 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 26DB464EF2
	for <linux-snps-arc@archiver.kernel.org>; Thu, 18 Mar 2021 01:03:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 26DB464EF2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9AIjqdxN2D8TOq5eQNgP186mQ8xDlGBdONL4BSS/VGE=; b=hydlILQojIRbxkkskdH1rbo02
	QnHbPHxNzi/Vj61XhUlmyaI0NJOyD3I1I87Vn8DWbSI9/AuwB8ojtQjc4I5I5ZoqvOPL5gLCXYK66
	RMAZkN2ZxSyagn9MexEff4RTJllHevku/dg624awwcx84+Dfo/8/wdnXsAQr3P7Dd5amgJc2bFUG0
	ygHotdR6RY+DZc3/nWp5KqCt/5mRm59+W+esGPXtwnyh89NjTzBs0dE19lwOTUFk5SKeiWGY2fnf4
	qFFETD/TkDCPAbyydR58mbzW3l98mwIRWDaE5oKDhF6n2tR+aaKaLVBOhALsH81vUkOZZL8Z1Fh15
	D1tdhwZzA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lMh4L-004DHr-Bs; Thu, 18 Mar 2021 01:03:22 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lMh38-004D9E-95; Thu, 18 Mar 2021 01:02:23 +0000
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4F17w73LVNzmZ6G;
 Thu, 18 Mar 2021 08:59:35 +0800 (CST)
Received: from [10.174.177.244] (10.174.177.244) by
 DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server id
 14.3.498.0; Thu, 18 Mar 2021 09:01:56 +0800
Subject: Re: [PATCH v2] mm: Move mem_init_print_info() into mm_init()
To: Dave Hansen <dave.hansen@intel.com>, <linux-kernel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>
CC: Russell King <linux@armlinux.org.uk>, Catalin Marinas
 <catalin.marinas@arm.com>, Richard Henderson <rth@twiddle.net>, Guo Ren
 <guoren@kernel.org>, Yoshinori Sato <ysato@users.sourceforge.jp>, Huacai Chen
 <chenhuacai@kernel.org>, Jonas Bonn <jonas@southpole.se>, Palmer Dabbelt
 <palmer@dabbelt.com>, Heiko Carstens <hca@linux.ibm.com>, "David S. Miller"
 <davem@davemloft.net>, Dave Hansen <dave.hansen@linux.intel.com>, "Peter
 Zijlstra" <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 <linux-alpha@vger.kernel.org>, <linux-snps-arc@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-csky@vger.kernel.org>,
 <linux-hexagon@vger.kernel.org>, <linux-ia64@vger.kernel.org>,
 <linux-m68k@lists.linux-m68k.org>, <linux-mips@vger.kernel.org>,
 <openrisc@lists.librecores.org>, <linux-parisc@vger.kernel.org>,
 <linuxppc-dev@lists.ozlabs.org>, <linux-riscv@lists.infradead.org>,
 <linux-s390@vger.kernel.org>, <linux-sh@vger.kernel.org>,
 <sparclinux@vger.kernel.org>, <linux-um@lists.infradead.org>,
 <linux-xtensa@linux-xtensa.org>, <linux-mm@kvack.org>
References: <4d488195-7281-9238-b30d-9f89a6100fb9@csgroup.eu>
 <20210317015210.33641-1-wangkefeng.wang@huawei.com>
 <2a7d6e39-b293-7422-87b0-741f1ab0c22c@intel.com>
From: Kefeng Wang <wangkefeng.wang@huawei.com>
Message-ID: <190f5356-f947-d474-a9fe-bc8e622a426e@huawei.com>
Date: Thu, 18 Mar 2021 09:01:54 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <2a7d6e39-b293-7422-87b0-741f1ab0c22c@intel.com>
Content-Language: en-US
X-Originating-IP: [10.174.177.244]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210318_010221_458767_59D8423F 
X-CRM114-Status: UNSURE (   9.02  )
X-CRM114-Notice: Please train this message.
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org


On 2021/3/18 2:48, Dave Hansen wrote:
> On 3/16/21 6:52 PM, Kefeng Wang wrote:
>> mem_init_print_info() is called in mem_init() on each architecture,
>> and pass NULL argument, so using void argument and move it into mm_init().
>>
>> Acked-by: Dave Hansen <dave.hansen@linux.intel.com>
> It's not a big deal but you might want to say something like:
>
> Acked-by: Dave Hansen <dave.hansen@linux.intel.com> # x86 bits
>
> Just to make it clear that I didn't look at the alpha bits at all. :)
Get it, will be careful, thanks.
> .
>

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
