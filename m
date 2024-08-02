Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1F9CC3DA4A
	for <linux-snps-arc@archiver.kernel.org>; Fri,  2 Aug 2024 07:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DFqAt1s0o6FWWJQoC9q+Expf3+P7EOthfIomjBZstlQ=; b=gqH5a3zxZ58ti6
	gQrWp8/CpRGz6dYFGyloqiucrrU3C9pMql6e91VvoU0VZx827CQuaELKWCv7aw+zi027K2ww0NBYz
	HiGE+6o1HiwRukvlR/JjQlxeU+wnJpxQsDgypIlqJiuov3jWKj5QsRvlrZ/AjruzjZs+YQjLEdmgO
	M0mr3CJU89M4me4U28hrIYKHzKTKCSOjfRY3McsmVyIS3gsqB9K23TvpusKaCLLKbICDoB3c9AuKk
	8VJGF/Zwsg60cofNzkObhZgX+660qO24FZdvHAniN6Bc1dAEC0qd2oMil97scEV17vwOGZG/man+G
	HOQl9nMB/bT9GWnn2QEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZmli-00000007xci-1zGn;
	Fri, 02 Aug 2024 07:32:06 +0000
Received: from mail.synergyflux.pl ([51.38.99.212])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZmlf-00000007xaI-0Yya
	for linux-snps-arc@lists.infradead.org;
	Fri, 02 Aug 2024 07:32:05 +0000
Received: by mail.synergyflux.pl (Postfix, from userid 1002)
	id 1A7302587E; Fri,  2 Aug 2024 09:31:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synergyflux.pl;
	s=mail; t=1722583921;
	bh=n9RRp8MlabRDJBtJNro49Rmci90RtotaZYZ8+xo6WI4=;
	h=Date:From:To:Subject:From;
	b=0CAiPVtE/cD+4MX1N2/coOTmHI4tJouTqlUBB1yiEqawoYvd4pBiaZLqLc9m1j2zY
	 FH86MfGHjDzSYwU0jCsTb9AzzyAEEb1l9fcqKrhLXrE6YnH4tcxtnvvhmRYQRh5JiE
	 7tbMAtwWFMOtn2WuDRcElCDQ68j99jvyIm+v+bMqdy15EoY+0+nxuTvX6B3tV0tlMx
	 GHpZlKrgMBvmEOICerXS5aHh0AIexcgwjbChjMQ23JAHU354kyTdVswyVgbqN5mxc0
	 9gp1QmNFtb+n2Becbne3Xa1CEodf+5PUHo6zwKb8aSrH7Wbi4/s7SyS6cl7G661z78
	 lVSS+w1gBa2qg==
Received: by mail.synergyflux.pl for <linux-snps-arc@lists.infradead.org>; Fri,  2 Aug 2024 07:30:58 GMT
Message-ID: <20240802084500-0.1.d4.39h9t.0.g3j1rhf671@synergyflux.pl>
Date: Fri,  2 Aug 2024 07:30:58 GMT
From: =?UTF-8?Q?"Konrad_Zieli=C5=84ski_"?= <konrad.zielinski@synergyflux.pl>
To: <linux-snps-arc@lists.infradead.org>
Subject: Instalacja pv
X-Mailer: mail.synergyflux.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240802_003203_385398_EB818B51 
X-CRM114-Status: UNSURE (   0.19  )
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
