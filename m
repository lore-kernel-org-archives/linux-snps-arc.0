Return-Path: <SRS0=7YWa=YT=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0F73CA9EBD
	for <linux-snps-arc@archiver.kernel.org>; Sat, 26 Oct 2019 13:10:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B683A222C3
	for <linux-snps-arc@archiver.kernel.org>; Sat, 26 Oct 2019 13:10:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RoMgxXJ+";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="ankEIq41"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B683A222C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:
	References:In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=TPXfflK20nI4JBB993y+6SQw776aVgFp4qrxw5zcti8=; b=RoMgxXJ+W3iRCCZp9ZzCmc0fUh
	OBaLLpT32+PnzGuWaw9taOaGRnP9uAJDpnpH5jF/Tdtz4c48yCXK8EU/JhV3xzQbOjYN2BrEyhu3P
	FJ52/aZEfg9rwSf4olKc6PqESR+vFaERcAYprAtjCkwWzRrg4C8hXJT/MVur+ZQRnaSSK15XwguK5
	SNHyFt4QJZb6DeSPhJR9eeNifkpBkOhglSbSWUhBTVAYPHBOMaAwLMHWKpm3oQCUmIYvsNUmazts6
	l3DyF8DZkTE2hNAPsah8yX5gkaxTdbVRsFMSfTxWpgReLvMeMvCnInbYZdnGOSfc/rrGf8jiUq0dA
	UEbNQuXA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iOLq9-0004w0-Ph; Sat, 26 Oct 2019 13:10:45 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iOLq7-0004ve-2c
 for linux-snps-arc@lists.infradead.org; Sat, 26 Oct 2019 13:10:45 +0000
Received: from localhost (unknown [40.117.208.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 73A7E206DD;
 Sat, 26 Oct 2019 13:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1572095442;
 bh=Ah8OnR5q1MWeUTM+DTuCuyCRw9ArELowWDLM7xCXC1M=;
 h=Date:From:To:To:To:Cc:Cc:Cc:Subject:In-Reply-To:References:From;
 b=ankEIq41FbWPOlWnvRJQXIKgJl+5egOZnUmyt3nd8fWeM//yDpjrmb1yMPGC2sdcd
 MYNbFtr+OvXjr/+HOG2OX+OudhWGQ9JE9C6vc/ffgxxwLuNNpvKJItHUPGpFak30zG
 zNBv1tqpcVOTu8sj1QTce8eNXPSfM84HsCGSJuS4=
Date: Sat, 26 Oct 2019 13:10:41 +0000
From: Sasha Levin <sashal@kernel.org>
To: Sasha Levin <sashal@kernel.org>
To: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
To: linux-snps-arc@lists.infradead.org
Subject: Re: [PATCH] ARC: perf: Accommodate big-endian CPU
In-Reply-To: <20191022140411.10193-1-abrodkin@synopsys.com>
References: <20191022140411.10193-1-abrodkin@synopsys.com>
Message-Id: <20191026131042.73A7E206DD@mail.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191026_061043_142209_10E5427E 
X-CRM114-Status: UNSURE (   6.85  )
X-CRM114-Notice: Please train this message.
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
Cc: , linux-kernel@vger.kernel.org, stable@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Hi,

[This is an automated email]

This commit has been processed because it contains a -stable tag.
The stable tag indicates that it's relevant for the following trees: all

The bot has tested the following trees: v5.3.7, v4.19.80, v4.14.150, v4.9.197, v4.4.197.

v5.3.7: Build OK!
v4.19.80: Failed to apply! Possible dependencies:
    0e956150fe09f ("ARC: perf: introduce Kernel PMU events support")
    14f81a91ad29a ("ARC: perf: trivial code cleanup")
    baf9cc85ba01f ("ARC: perf: move HW events mapping to separate function")

v4.14.150: Failed to apply! Possible dependencies:
    0e956150fe09f ("ARC: perf: introduce Kernel PMU events support")
    14f81a91ad29a ("ARC: perf: trivial code cleanup")
    4d431290402c8 ("ARCv2: perf: tweak overflow interrupt")
    baf9cc85ba01f ("ARC: perf: move HW events mapping to separate function")

v4.9.197: Failed to apply! Possible dependencies:
    0e956150fe09f ("ARC: perf: introduce Kernel PMU events support")
    14f81a91ad29a ("ARC: perf: trivial code cleanup")
    4d431290402c8 ("ARCv2: perf: tweak overflow interrupt")
    baf9cc85ba01f ("ARC: perf: move HW events mapping to separate function")

v4.4.197: Failed to apply! Possible dependencies:
    05c74e5e53f6c ("bpf: add bpf_skb_load_bytes helper")
    0e956150fe09f ("ARC: perf: introduce Kernel PMU events support")
    14f81a91ad29a ("ARC: perf: trivial code cleanup")
    3379e0c3effa8 ("perf tools: Document the perf sysctls")
    45d8390c56bd2 ("bpf: hash: move select_bucket() out of htab's spinlock")
    538950a1b7527 ("soreuseport: setsockopt SO_ATTACH_REUSEPORT_[CE]BPF")
    568b329a02f75 ("perf: generalize perf_callchain")
    6591f1e6662dd ("bpf: hash: use atomic count")
    688ecfe602205 ("bpf: hash: use per-bucket spinlock")
    75925e1ad7f5a ("perf/x86: Optimize stack walk user accesses")
    781c53bc5d562 ("bpf: export helper function flags and reject invalid ones")
    824bd0ce6c7c4 ("bpf: introduce BPF_MAP_TYPE_PERCPU_HASH map")
    a10423b87a7ea ("bpf: introduce BPF_MAP_TYPE_PERCPU_ARRAY map")
    baf9cc85ba01f ("ARC: perf: move HW events mapping to separate function")
    c5dfd78eb7985 ("perf core: Allow setting up max frame stack depth via sysctl")
    c6c33454072fc ("bpf: support ipv6 for bpf_skb_{set,get}_tunnel_key")
    cfbcf468454ab ("perf core: Pass max stack as a perf_callchain_entry context")
    d5a3b1f691865 ("bpf: introduce BPF_MAP_TYPE_STACK_TRACE")
    e32ea7e747271 ("soreuseport: fast reuseport UDP socket selection")
    ef456144da8ef ("soreuseport: define reuseport groups")
    f8ffad69c9f8b ("bpf: add skb_postpush_rcsum and fix dev_forward_skb occasions")


NOTE: The patch will not be queued to stable trees until it is upstream.

How should we proceed with this patch?

-- 
Thanks,
Sasha

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
