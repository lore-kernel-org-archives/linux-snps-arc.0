Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2EF9C48BF8
	for <linux-snps-arc@archiver.kernel.org>; Thu, 22 Feb 2024 10:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=thX5RyYQBHC0ABXcYMX+aBrFcvjNMQYGUp/OgoH92BE=; b=ltZpfF9zMSLRG2
	76KIB1kPENNFUTJiUKF49pquK2mEcwb1AnjnJS+Whjal1DLWvZEb8PJqiPxNxhH4WiWpWRRqqD4A6
	xh9aVF+s8Kj3mNkzNx5MDTgnHz5FvzXxcFOPPAoK/KYfUr185Gl3ORsq+I90x7bt80DRuTvQk5KvW
	sL4iaycv4VYyt7YW8hIRx6dVwKWkI8PJQGUDyZbf5swOe8VwcMGOn5RmDnN4hPfhVz7roFO8+vgzr
	171cBhREbM4zUmw70TWa1knrJfzq/4fR8hEQAWT0xEinkP1w7mMJtcX3C+nbJ0ozVjHElk+bDgLdV
	/WtJABJSCRddoh4n8ZrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rd5sc-00000004Obo-1sCx;
	Thu, 22 Feb 2024 10:00:38 +0000
Received: from mail.thrivehub.pl ([164.132.48.43])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rd5sZ-00000004OZ8-3rQy
	for linux-snps-arc@lists.infradead.org;
	Thu, 22 Feb 2024 10:00:37 +0000
Received: by mail.thrivehub.pl (Postfix, from userid 1002)
	id CA22824634; Wed, 21 Feb 2024 08:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=thrivehub.pl; s=mail;
	t=1708505149; bh=m3ZUCTPRVLoDFM+cXi7VhHW+xNF3eUdGHrj1eDbLwQI=;
	h=Date:From:To:Subject:From;
	b=tTPp48zUiR/e/EWzHHgYnp6w4bv5uf0ck/D5L7a6x8JBX65MCe5lm+08/c9F7CftK
	 AwCf1Qxb8sqVuyv0U2ZQxsy1jQIJ5Gxn7BoqJfjBbTUchcZY2RG8RkrYepDjRvPrNG
	 2MNBVxqJAN8Q+UxIFxCrCWfLZ7VkxWF3DcDIrpLSi7h3UKkh1QbynZH/EBRjfpwVYc
	 BvgtxGEt2rYBSGfEJl3vqmFxu8nAw2hYMWwBwyakys8iRk26IIBSMEGqngqF1TO+Dd
	 JSnJWH3EZKfxR9wjGnwzELtGD7o0Dx2R1NP1GBoDuLLSil8E9mRoqOQrCOTFTkSkE3
	 YP3c8EfZaSpbw==
Received: by mail.thrivehub.pl for <linux-snps-arc@lists.infradead.org>; Wed, 21 Feb 2024 08:45:49 GMT
Message-ID: <20240221074500-0.1.4r.2339g.0.icwhi3jkd8@thrivehub.pl>
Date: Wed, 21 Feb 2024 08:45:49 GMT
From: "Szymon Jankowski" <szymon.jankowski@thrivehub.pl>
To: <linux-snps-arc@lists.infradead.org>
Subject: Zapytanie ofertowe 
X-Mailer: mail.thrivehub.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240222_020036_138841_0421BFE0 
X-CRM114-Status: UNSURE (   1.41  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

RHppZcWEIGRvYnJ5LAoKUG96d29sacWCZW0gc29iaWUgbmEga29udGFrdCwgcG9uaWV3YcW8IGpl
c3RlbSB6YWludGVyZXNvd2FueSB3ZXJ5ZmlrYWNqxIUgbW/FvGxpd2/Fm2NpIG5hd2nEhXphbmlh
IHdzcMOzxYJwcmFjeS4KCldzcGllcmFteSBmaXJteSB3IHBvenlza2l3YW5pdSBub3d5Y2gga2xp
ZW50w7N3IGJpem5lc293eWNoLgoKQ3p5IG1vxbxlbXkgcG9yb3ptYXdpYcSHIHcgY2VsdSBwcnpl
ZHN0YXdpZW5pYSBzemN6ZWfDs8WCb3d5Y2ggaW5mb3JtYWNqaT8gCgoKUG96ZHJhd2lhbQpTenlt
b24gSmFua293c2tpCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1zbnBzLWFyYyBtYWlsaW5nIGxpc3QKbGludXgtc25wcy1hcmNAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXNucHMtYXJjCg==
