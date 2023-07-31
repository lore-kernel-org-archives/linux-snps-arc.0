Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93644C04A94
	for <linux-snps-arc@archiver.kernel.org>; Mon, 31 Jul 2023 08:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=c2TSIl2vhz7v74fQsrbTNMBzo+xoJrF4JP+BTJ4IHHQ=; b=TI6rNAeDFLkLVQ
	mz3XbEQl0LFuoRcjc0NAcw3zAlxt0VM4/uEQ7/TKx9f7+5rK0DqCB+QB/PEhULLABSP4qpRszdhBs
	0wUVviTgqGTpjpkdc4hux9M0lZrnq9NoG9gn4QlmOktOUTPLKtFPW4LDqCDbpR/FRVlgQz2xlqPJS
	HPujWLjaEMDQ1pSy5cefU6heHvrWSp9NdBC9OgYIWwkQ89cZ5xyOSWSXB8UTxZ+mmkKTTpU+JRBbj
	KvjFYCbiICkmjMhv6dCEHX2I2WxycUTjX+5Yt+bzJdBhryRNQbTyMm2eSyl1bxextar9P7g8EbPEN
	7qpYQRDzttEAZgkw/XYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQOQX-00EZ78-1f;
	Mon, 31 Jul 2023 08:38:53 +0000
Received: from mail.cothiafon.pl ([217.61.106.23])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQOQC-00EYwQ-33
	for linux-snps-arc@lists.infradead.org;
	Mon, 31 Jul 2023 08:38:35 +0000
Received: by mail.cothiafon.pl (Postfix, from userid 1002)
	id 9DFD582F23; Mon, 31 Jul 2023 10:35:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=cothiafon.pl; s=mail;
	t=1690792552; bh=dwoca0X6C9VXklO/zRgFQCPapTk5LFz4tKaENdvy6Po=;
	h=Date:From:To:Subject:From;
	b=GuSuJ4Zzq2kBb+u/m78vyoUF3xsSzAipk6bAJtmvBNu9nBlBifxW7mWPgQ3HsQdw2
	 qv0zfanIvENvLIGLmlsid1T2pAiYKabHOx/uapUw9lxf50Q9oX46avJBmwBrHRF9ZS
	 HhXqBBtIj5teEMuzESsVw8IdvK2nBPmdLytiuZ2+IbQnms0NhAgizFH9UFqEGwHyrN
	 cRfE7+2AJ0gFE9xTpdCVhX8GiSVQgguQzULO36tCKzFscs4fVJIDo5X//NUE30+jta
	 DHlv0wZhEepIrgRn8EUzRw4XigXEtosKQy9bnTRBatfUVibOm8ZiYTNrVsqO8XqTRk
	 FwTYcUqj9CL1Q==
Received: by mail.cothiafon.pl for <linux-snps-arc@lists.infradead.org>; Mon, 31 Jul 2023 08:35:48 GMT
Message-ID: <20230731095940-0.1.28.omi7.0.xor5h3jrxz@cothiafon.pl>
Date: Mon, 31 Jul 2023 08:35:48 GMT
From: =?UTF-8?Q?"Rados=C5=82aw_Grabowski"?= <radoslaw.grabowski@cothiafon.pl>
To: <linux-snps-arc@lists.infradead.org>
Subject: W sprawie samochodu
X-Mailer: mail.cothiafon.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230731_013833_715278_834AF3D1 
X-CRM114-Status: UNSURE (   0.31  )
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

RHppZcWEIGRvYnJ5LAoKY2hjaWVsaWJ5xZtteSB6YXBld25pxIcgUGHFhHN0d3Uga29tcGxla3Nv
d2Ugcm96d2nEhXphbmlhLCBqZcWbbGkgY2hvZHppIG8gc3lzdGVtIG1vbml0b3Jpbmd1IEdQUy4K
ClByZWN5enlqbmUgbW9uaXRvcm93YW5pZSBwb2phemTDs3cgbmEgbWFwYWNoIGN5ZnJvd3ljaCwg
xZtsZWR6ZW5pZSBpY2ggcGFyYW1ldHLDs3cgZWtzcGxvYXRhY3lqbnljaCB3IGN6YXNpZSByemVj
enl3aXN0eW0gb3JheiBrb250cm9sYSBwYWxpd2EgdG8ga2x1Y3pvd2UgZnVua2Nqb25hbG5vxZtj
aSBuYXN6ZWdvIHN5c3RlbXUuIAoKT3JnYW5pem93YW5pZSBwcmFjeSBwcmFjb3duaWvDs3cgamVz
dCBkemnEmWtpIHRlbXUgcHJvc3RzemUgaSBiYXJkemllaiBlZmVrdHl3bmUsIGEgb3N6Y3rEmWRu
b8WbY2kgaSBvcHR5bWFsaXphY2phIHcgemFrcmVzaWUgcG9ub3N6b255Y2gga29zenTDs3csIG1h
asSFIGRsYSBrYcW8ZGVnbyBwcnplZHNpxJliaW9yY3kgb2dyb21uZSB6bmFjemVuaWUuCgpEb3Bh
c3VqZW15IG5hc3rEhSBvZmVydMSZIGRvIFBhxYRzdHdhIG9jemVraXdhxYQgaSBwb3RyemViIG9y
Z2FuaXphY2ppLiBDenkgbW9nbGliecWbbXkgcG9yb3ptYXdpYcSHIG8gbmFzemVqIHByb3Bvenlj
amk/CgoKUG96ZHJhd2lhbQpSYWRvc8WCYXcgR3JhYm93c2tpCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1zbnBzLWFyYyBtYWlsaW5nIGxpc3QK
bGludXgtc25wcy1hcmNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXNucHMtYXJjCg==
