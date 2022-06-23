Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60AE2C43334
	for <linux-snps-arc@archiver.kernel.org>; Thu, 23 Jun 2022 02:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vY0NwZjj9rvFxF0gO1XmqK1kmRRu3TVBmPlV70RKlpY=; b=oInrISjXyL89gD
	AdIsISETHIGzA3k4Lh4Omxo2iGMEZwxEGLKBUU4icAI04/bsU8Q47JrTEE9shkBszxL3csPkeCdTK
	QSVu81rYFz0+veYYmGmMSKor4W+pFTOY4QO02LA8ISfr8Gmxi5vXfvvv2HojBQ/etK9+ixSKfsHjZ
	CoEec8QOUWjCEyw4+Xj/JkbvPpphyhBSdDM20Dly71Pkieq5nsdP6CbwQhR9astrAxQzpE3xozinD
	epNSfkvLJXEa3zTG4MRuE9A3tpRZ7bU3+91RTnD8kx9GszrOvggbTqnDQaTUDs1EcWMEbDtRYPcWm
	VcZVpOHmyRLOr/4rNVXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4Cvg-00D6Ae-Kp; Thu, 23 Jun 2022 02:50:48 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4Cvd-00D691-WE
	for linux-snps-arc@lists.infradead.org; Thu, 23 Jun 2022 02:50:47 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 849ACB821B2;
	Thu, 23 Jun 2022 02:50:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCE13C3411B;
	Thu, 23 Jun 2022 02:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655952642;
	bh=tdjqAoX1yhdrpIxkENpUPLNuE3udmL20asfAlDU2UE8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NR3MzgCn0M9xNzjgxW4DiNcaOfjdT5xFRtXSTrKhRwh1aJwGJKt8OJL/qjU6zyigi
	 RM3/yl9kLN18sxoibaHEn1e3iQytkmw/XaJ8B/ytfU+jZ5ZfBq+HCN9PkWuRU194wB
	 j9yTm+cUfV/zhqRESBgpGvydNhFCDiGr3U6PMr1AUWC+JeCVtfl+nhV6arfj0nAnw+
	 J+rHO7BpVtp6p7MsxJNnGVx1EOghJYS9H++U3TmWfP9txP1vjbDPEzKULbe6m1cF2n
	 mYGAEq8U30ZG/nnRTeF+P+uHHG6H2gOFl19EAO0mh5482rrfEDVGlnk8kK9bpDhcFb
	 d+ChdDrBk5fhA==
Message-ID: <d104124c-5196-bc80-b3e3-0ab55f0cc35e@kernel.org>
Date: Wed, 22 Jun 2022 19:50:39 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] ARC:mm:Fix syntax errors in comments
Content-Language: en-US
To: Bagas Sanjaya <bagasdotme@gmail.com>, Jilin Yuan <yuanjilin@cdjrlc.com>
Cc: vgupta@kernel.org, Julia.Lawall@inria.fr, rdunlap@infradead.org,
 linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220622080423.41570-1-yuanjilin@cdjrlc.com>
 <YrLTCXLrr3HB39lv@debian.me>
From: Vineet Gupta <vgupta@kernel.org>
In-Reply-To: <YrLTCXLrr3HB39lv@debian.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220622_195046_234328_4E1B2CEF 
X-CRM114-Status: GOOD (  11.05  )
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



On 6/22/22 01:30, Bagas Sanjaya wrote:
>> - * If the U-mapping is not congruent to to K-mapping, former needs flushing.
>> + * If the U-mapping is not congruent to K-mapping, former needs flushing.
>>    */
>>   void flush_dcache_page(struct page *page)
>>   {
> The patch is OK, but its subject is wrong.

Right.

> The patch above isn't fixing any syntax errors, but rather minor cleanup.
> The subject should have been "Remove duplicate 'to' in the
> flush_dcache_page() comment".

I'd just say "ARC: mm: fix typos"

> I think that this kind of cleanup patches (typofixes) are best done
> as part of **actual** work on the code in question (for example
> refactoring or fixing build errors).

In an ideal world yes. But sometimes maintainer complain to break 
whitespacxe fixes and such into independent fix. Also as someone said 
later in the thread, for somebody just getting into kernel and figuring 
out patch submission etc this could be a perfect dry run and helps 
improve the code anyways.

-Vineet

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
