Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68150C43334
	for <linux-snps-arc@archiver.kernel.org>; Thu,  9 Jun 2022 15:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iLmCfbeRrX3Rb4TGG8qJCkCPGeH2OOEAJKeNqV3QQdg=; b=IfL0u80JnO+k5D
	4bCyzY07VwZZjk/fshRbiJMSiu4COKg/510ESyxB0iEvd9hR+P9gv57LrqOUo5iNRU0l9CyAI7IYi
	p/mTHnQb6ayoojnJqzirulo14CYVr0LStvm7iTaRvbHt63fsjtdsK6bThfLUKqS+PkM7lzFYujd3I
	xKDShIQyXDwZZU+mozUhMgkTd8C0tVAmK2S+NfgV225zbnRKzHk2yyPexSc/iuac6uSeSaZrtyAVV
	iCII78080dyFWLT6eZ5VIDjQQcsqeHYB0sxv1zbMNcUkUV1O507ywRUjpvMUIsGf0FXmYvCv1oeMP
	ALAXtQpb3Xu36uCNzTrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzKDn-002kQh-CZ; Thu, 09 Jun 2022 15:37:19 +0000
Received: from ms.lwn.net ([45.79.88.28])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzKDg-002kMV-HJ; Thu, 09 Jun 2022 15:37:14 +0000
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 20F78732;
	Thu,  9 Jun 2022 15:37:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 20F78732
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1654789028; bh=jXFbEEfMo94jqkW6tuNpH8AsDAPWTArR6H5stWd/n8g=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=kgRtuxKiWJBVN9UT+ESqsqC2HeVBDChFxPwYco0a3vXwOXGghtp62gbO8MYnC2AS/
	 VrYk+eYdw3eS0ZOOYyU7EDtni7hQNZFA2PpB0/NbDM5fyQtoaBWHIfNM8EaktE7/qJ
	 /57smUCigcNIbTNal9ngJEEWqc9nQ9omtFNToWqwfe+pTqi4udNP+lbQ+arN16D0C0
	 qPeRx9ETKeB/LKQ01bRS9U0TIUQ7Sc952gvek8UwoRCCxnfNTreVpBwRXZmyo7fePY
	 cXQPTj1KqzCTkUJSP/unN/hua8S9FCDiDVcq51hgng//JR3cvF+UpdL4SxEZVis63X
	 iVQT2HuTCpD/Q==
From: Jonathan Corbet <corbet@lwn.net>
To: Zheng Zengkai <zhengzengkai@huawei.com>
Cc: chenhuacai@kernel.org, kernel@xen0n.name, deller@gmx.de,
 linux-parisc@vger.kernel.org, vincent.whitchurch@axis.com, richard@nod.at,
 linux-um@lists.infradead.org, palmer@dabbelt.com,
 linux-riscv@lists.infradead.org, vgupta@kernel.org,
 sergey.matyukevich@synopsys.com, linux-snps-arc@lists.infradead.org,
 linux-kernel@vger.kernel.org, liwei391@huawei.com, zhengzengkai@huawei.com
Subject: Re: [PATCH] Documentation/features: Update the arch support status
 files
In-Reply-To: <20220609025656.143460-1-zhengzengkai@huawei.com>
References: <20220609025656.143460-1-zhengzengkai@huawei.com>
Date: Thu, 09 Jun 2022 09:37:07 -0600
Message-ID: <87pmjh4zmk.fsf@meer.lwn.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220609_083712_615910_CD03C87D 
X-CRM114-Status: UNSURE (   8.51  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Zheng Zengkai <zhengzengkai@huawei.com> writes:

> The arch support status files don't match reality as of v5.19-rc1,
> use the features-refresh.sh to refresh all the arch-support.txt files
> in place.
>
> Signed-off-by: Zheng Zengkai <zhengzengkai@huawei.com>

I've applied this, but added a note to the changelog saying that the
main change is to add the loong architecture.

Thanks,

jon

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
