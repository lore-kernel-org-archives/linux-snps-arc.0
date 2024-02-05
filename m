Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7ABBC48291
	for <linux-snps-arc@archiver.kernel.org>; Mon,  5 Feb 2024 09:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DFqAt1s0o6FWWJQoC9q+Expf3+P7EOthfIomjBZstlQ=; b=ZQYBbYSc/OVxO/
	OxH33L41Vy4GUL+x3jNae39ymcmfF+9LH1SrNcQJDovoul+FeYf53qN7xiAt6GOEZw/mLx74JR2AZ
	AzoYsqBnKtQ3FS5JA6k1QZprtxv9d43h+uPCaC6+xG5bDYRMbD7SYcnT9njfZ6j6yW0zzF8yGLVFt
	5p1W5zno5NIiLgZImqMTG/x4Iou4el7Egijx2VSXfRFix3WZ3t669UIhWvMbBiHYxrVdcXEV8ug4V
	gdVKVtqEFdehc8t4K7vt054kRXLfSuyV8fztnw+WzXuG4VvjUvmhfeCDAeXTTLfvihQXRtGaVfaQF
	L+PG5pAvcWOoN9LJMyPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rWuwA-00000002X2t-1npX;
	Mon, 05 Feb 2024 09:06:46 +0000
Received: from mail.synergyflux.pl ([51.38.99.212])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rWuw7-00000002X1A-1bRO
	for linux-snps-arc@lists.infradead.org;
	Mon, 05 Feb 2024 09:06:44 +0000
Received: by mail.synergyflux.pl (Postfix, from userid 1002)
	id BB1D524A9B; Mon,  5 Feb 2024 09:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synergyflux.pl;
	s=mail; t=1707124000;
	bh=n9RRp8MlabRDJBtJNro49Rmci90RtotaZYZ8+xo6WI4=;
	h=Date:From:To:Subject:From;
	b=zf5dsHNENjD45eUeytcB+mXncMxKgvXLYpige32ThKoRMfuf7iwu0uI1IXqzDjlyw
	 wXhyd3kvKfrFEgK4ARLs/jTDl6oXJb/wHVd+NFvhWZgEulffMyVJ02cTXHmxRcA2+b
	 zzjp3sVbHUW1miipJnZgZy41NVtwKTxnJ+7ECALRBGf0EZv3jSP5UYkf3H511cLu+e
	 hBqZu3whG/sOgK2WYUeFIa2agQSWpZjCOfzfvo2hAv8IHe04A9YSPcOKAWyQNmlNEt
	 bWwIAoH3s3ZTYyFvrPg3UiixQuV4K5vWHw1X5eCWVFXOGVeXKHUJbmo7tluBhfswyF
	 YFoa3BxCIPJkA==
Received: by mail.synergyflux.pl for <linux-snps-arc@lists.infradead.org>; Mon,  5 Feb 2024 09:05:33 GMT
Message-ID: <20240205074500-0.1.9m.1w5wo.0.e4mbwgx39f@synergyflux.pl>
Date: Mon,  5 Feb 2024 09:05:33 GMT
From: =?UTF-8?Q?"Konrad_Zieli=C5=84ski_"?= <konrad.zielinski@synergyflux.pl>
To: <linux-snps-arc@lists.infradead.org>
Subject: Instalacja pv
X-Mailer: mail.synergyflux.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240205_010643_616440_735852A6 
X-CRM114-Status: UNSURE (   0.72  )
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

RHppZcWEIGRvYnJ5LAoKY3p5IHPEhSBQYcWEc3R3byBvdHdhcmNpIG5hIG5pZXpvYm93acSFenVq
xIVjxIUgcm96bW93xJkgbmEgdGVtYXQgZm90b3dvbHRhaWtpPwoKSmFrbyBmaXJtYSBzcGVjamFs
aXp1asSFY2Egc2nEmSB3IGluc3RhbGFjamkgaSBzZXJ3aXNpZSBuYWpsZXBzenljaCBqYWtvxZtj
aW93byBwYW5lbGkgc8WCb25lY3pueWNoIG5hIHJ5bmt1IGNoY2lhxYJieW0gcHJ6ZWRzdGF3acSH
IHByb3BvenljasSZLCBqYWvEhSB3c3DDs2xuaWUgeiB6ZXNwb8WCZW0gcHJ6eWdvdG93YWxpxZtt
eSBkbGEgUGHFhHN0d2Egb2JpZWt0dS4KCkLEmWTEmSB3ZHppxJljem55IHphIHdpYWRvbW/Fm8SH
IG9kIFBhxYRzdHdhIGN6eSBtb8W8ZW15IHBvcm96bWF3aWHEhy4KCgpQb3pkcmF3aWFtCktvbnJh
ZCBaaWVsacWEc2tpIAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtc25wcy1hcmMgbWFpbGluZyBsaXN0CmxpbnV4LXNucHMtYXJjQGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1zbnBzLWFyYwo=
