Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66F12C433F5
	for <linux-snps-arc@archiver.kernel.org>; Mon, 18 Apr 2022 19:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=07B15gGsHjNTPZ/ADbVlHbpEzk8Ih6W63KA7LsH0kSE=; b=eVO155C0ECPTPU
	YMLsN0umcr/TiAVuVV2I+l9iQqOoTVMyjtamrwcQXp1FhFz9V7PZsHYQ6IHJwfmGxIEDyZrKsttxl
	PVdCr76k20ouuCS3rL7+ds9Y8d56NgVTuhYSsislwegsHu8gVV5n7XKdmYo4+mAZi5zrXLM94dcFx
	3bhOA6+Ts6xaQl//VxPxRSrl9Bs61MptZyx6oKvBFVxzPfyB/E8JVfkXFImlK7BRLpw89tTezYTSe
	JvNwM+CbjfONYRjW0/ocfvqoEOWLBDdKIBRSEICiIXY3ch+M0xLi2CgiA8SJHYXP9ehnAP9r/0W2a
	u4IE48dZJdi3s/dqXOQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngWwd-000RRO-Mg; Mon, 18 Apr 2022 19:21:55 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngWwa-000RPB-5T
 for linux-snps-arc@lists.infradead.org; Mon, 18 Apr 2022 19:21:53 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 82FC9B8106E;
 Mon, 18 Apr 2022 19:21:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E06CEC385A7;
 Mon, 18 Apr 2022 19:21:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650309709;
 bh=F240PBxYpZla1ryYurxeW3a9XB9s9HfDW2MUlKI6Vbg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Rwn6Y11bbLWi+nF98Ulkecx6wNaKwvJDes4P2FyJCc3b+FxgF41dIX3dK/z1h2Z8T
 jTK4xD/u0ReEvlmNQt/qkncoB364auvKToGPCkjvSCbzQ7Sw9GP5XcHmgFp3LfWpdU
 1Uf2fFdLzqBDW5eEX4KUC2nwTOt11fUJj6+Hs9XF2MwwIRrUsmwTrceBcWtERPm89k
 HrKqY32ZwKUHOY/aRSrECZxkaCdWOFmYdNIN5uSx3o+mzzdtZ8uvovFVbALOPcwLVq
 FgN/5hipZIZeQJcwNHfBkkTx2AY3bWXCUBzfiX8KcgnZ2OFmXxWUjCiBrjD1NN/lC4
 iDEu5FVxIvRVQ==
Message-ID: <0999f8ef-0df9-9226-8e7b-f6ed2a6b16b7@kernel.org>
Date: Mon, 18 Apr 2022 12:21:47 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] ARC: Remove a redundant memset()
Content-Language: en-US
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Vineet Gupta <vgupta@kernel.org>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-snps-arc@lists.infradead.org
References: <98e53b48968d3c29be44f6a302a04e64e5b59f08.1647978533.git.christophe.jaillet@wanadoo.fr>
From: Vineet Gupta <vgupta@kernel.org>
In-Reply-To: <98e53b48968d3c29be44f6a302a04e64e5b59f08.1647978533.git.christophe.jaillet@wanadoo.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220418_122152_398674_A8CFC289 
X-CRM114-Status: UNSURE (   8.05  )
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



On 3/22/22 12:49, Christophe JAILLET wrote:
> disasm_instr() already call memset(0) on its 2nd argument, so there is no
> need to clear it explicitly before calling this function.
>
> Remove the redundant memset().
>
> Signed-off-by: Christophe JAILLET<christophe.jaillet@wanadoo.fr>


Applied.

Thx,
-Vineet

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
