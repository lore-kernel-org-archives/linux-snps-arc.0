Return-Path: <SRS0=gXlX=NC=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81EA4C4320A
	for <linux-snps-arc@archiver.kernel.org>; Wed, 11 Aug 2021 19:30:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 46C2B60F21
	for <linux-snps-arc@archiver.kernel.org>; Wed, 11 Aug 2021 19:30:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 46C2B60F21
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hTaLF424Aj9tgjlH0mCJEd2z9qe5gCX1I+b3Y4PP1kE=; b=Vkal8Ql40LD0DJ2DhjhBNL1xxn
	eEfexJ8BQVAS2XJcxsTKjatzX5so3rrMp8B6W5azSnCKYPpQulIGtIEiW0FMS9iufC5Vc9fteHJsF
	o+8R/zraHPjzCEj2TVF6SW43LZc3z73xq+Zl12gNSktoP+JaHLrqXF7QuQJtpCtXRWmvuDo+u5m+9
	yDXl/jMyopBrJ345GL8BxcXIYiddzgWBZO6IpKAAMvE0GHapW247ilTwhwdVQ6GygT2BSBJsqjJmw
	Uk559NHV7EAkHemy2hHVfiTelMGRIGrC9z/99NI27M04ZpGllY8Gayh/TWDqw/5fuVY9+YpluPC1L
	OgTuiuww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mDtvX-007zfB-Mb; Wed, 11 Aug 2021 19:30:11 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mDtvV-007zeN-14
 for linux-snps-arc@lists.infradead.org; Wed, 11 Aug 2021 19:30:10 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4C72B60F21;
 Wed, 11 Aug 2021 19:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628710208;
 bh=dN2zuhazA3CjAHrGk/MFOiUoZnvZGI65FgI3dtYlVec=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=pJPKwZfF1m74I3LpREvFNeTJFMVKWShoFzBV9iYcOo6B504i5O+vOaFzdh+nkUiG6
 Owdo430sjHVxMBn9jN1kzDGDbwe8NvOslpYtUJc/toSlU9/77CHnPRLEja9BSD1Maz
 yU3OhWkelUXCOp/P+r9qcu2lfzmFgnPaCv31qBYwpu1d2j1X0ZDoZ/GR2fJlRVHWp5
 pFSFtcYyHN8jO71FN0DlL5sLj82TppVDmla54n9D+7XyGm9btmo1qUwaYGlf6cNBNR
 jEg3oOBZRNrDR4mkx3ME6v8+AftqxHcaQ8uumdO0nju7OY9G2+oVrgRGuOYi2Bm/fs
 FlvVegXChqr2w==
Subject: Re: [PATCH 11/18] ARC: mm: move MMU specific bits out of entry code
To: Mike Rapoport <rppt@kernel.org>
Cc: linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Anshuman Khandual <anshuman.khandual@arm.com>,
 Jose Abreu <joabreu@synopsys.com>
References: <20210811004258.138075-1-vgupta@kernel.org>
 <20210811004258.138075-12-vgupta@kernel.org> <YRO/VSMNi00X37xQ@kernel.org>
From: Vineet Gupta <vgupta@kernel.org>
Message-ID: <3236255f-8031-8fb2-8ab0-9faea5fa82f3@kernel.org>
Date: Wed, 11 Aug 2021 12:30:07 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YRO/VSMNi00X37xQ@kernel.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210811_123009_138576_81B767B2 
X-CRM114-Status: UNSURE (   8.42  )
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

On 8/11/21 5:15 AM, Mike Rapoport wrote:
> I believe a few words here would be useful even for the future version of
> yourself ;-)

"Don't pollute common entry file with MMU versions specific bits (as new 
MMU doesn't have PID register)"

However Jose thankfully pointed me (off list) that this patch is broken 
(based on some internal emails).
Any Machine check disables MMU but we now we only re-enable for TLB 
faults related MC, so this will have to be redone.

Thx,
-Vineet

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
