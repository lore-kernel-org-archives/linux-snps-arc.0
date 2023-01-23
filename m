Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1DBAC05027
	for <linux-snps-arc@archiver.kernel.org>; Mon, 23 Jan 2023 08:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3Ba/i89Tb7lrVgOAIMKWj2BZ5HyYxGQbA/sbBUeHgRE=; b=D5grkl8EghD+xj
	BBRZOIFQH9DWhuZNs5PMASLfN1aiFNLaJEKsxVBTIi+SMtYc1OQOm/tVTIL6zoyCn7XJKMeRM88tA
	KeOAhWXWG4WQEhnqwlmoAlyvheny1qWESj4VAqLi/gshq+wHvFwqvG4gog4uDbNfiR0b5q26/TDrK
	0Ap+msoT6GqU46QmlHJK9nro9EAvrTuU1vNaZa2bx3fWkj+rBI5PoLjVdUlR02nZVNvgn2vVLX/gk
	3O/cXbIVtKDFD8pcrSn2+vKpoVKvsNw3d6TzQwDHwln53EarXuE32TlqMR34/caa5hMNqvR6qfaTG
	+LOiuZctrYgWBCo/KBgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJsMt-00GNwQ-2n; Mon, 23 Jan 2023 08:39:55 +0000
Received: from mail.tryweryn.pl ([5.196.29.197])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJsMq-00GNuV-5j
	for linux-snps-arc@lists.infradead.org; Mon, 23 Jan 2023 08:39:53 +0000
Received: by mail.tryweryn.pl (Postfix, from userid 1002)
	id C65F4A235E; Mon, 23 Jan 2023 08:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tryweryn.pl; s=mail;
	t=1674463181; bh=Bo+/jg3TCpOeS79PpZREuOWEeqJV//jojylD9dSrSik=;
	h=Date:From:To:Subject:From;
	b=XCYUALg3QfCUw8ml8FFyOFukgcHBE2VU1jdqfbHAu/+zMrOkuGc/aRugyEZKdTolx
	 RT2AXROv1suswAjtagFK9gLXLQWV2OHeqBbnYBqnpFUmU2cTrsQUZZkwkWL+Y5r7eO
	 ij+vQNQHN6GspDogyEAo38Fb328i0qAFmrXba0K/REIfqJtvzDcF7+/5cDpg2FkNI2
	 nlO0x6xMgaCFKeZQFGRPtm912DMI3V3HXQiTa0UKwKd56xsD5vRU63g/IrX+AdeK0N
	 z/137/QT1l4BFcpBJyL/6/fq1flpUZZKjBAFpwbf/JlasOxbc0ujeor11AZsVdASve
	 2mEeE2QOp1O/w==
Received: by mail.tryweryn.pl for <linux-snps-arc@lists.infradead.org>; Mon, 23 Jan 2023 08:37:38 GMT
Message-ID: <20230123081829-0.1.7p.2rw4x.0.bsqtdlynqb@tryweryn.pl>
Date: Mon, 23 Jan 2023 08:37:38 GMT
From: "Karol Michun" <karol.michun@tryweryn.pl>
To: <linux-snps-arc@lists.infradead.org>
Subject: Prezentacja
X-Mailer: mail.tryweryn.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230123_003952_403995_44AE2812 
X-CRM114-Status: UNSURE (   1.11  )
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

RHppZcWEIGRvYnJ5IQoKQ3p5IG3Ds2fFgmJ5bSBwcnplZHN0YXdpxIcgcm96d2nEhXphbmllLCBr
dMOzcmUgdW1vxbxsaXdpYSBtb25pdG9yaW5nIGthxbxkZWdvIGF1dGEgdyBjemFzaWUgcnplY3p5
d2lzdHltIHcgdHltIGplZ28gcG96eWNqxJksIHp1xbx5Y2llIHBhbGl3YSBpIHByemViaWVnPwoK
RG9kYXRrb3dvIG5hc3plIG5hcnrEmWR6aWUgbWluaW1hbGl6dWplIGtvc3p0eSB1dHJ6eW1hbmlh
IHNhbW9jaG9kw7N3LCBza3JhY2EgY3phcyBwcnplamF6ZMOzdywgYSB0YWvFvGUgdHdvcnplbmll
IHBsYW51IHRyYXMgY3p5IGRvc3Rhdy4KClogbmFzemVqIHdpZWR6eSBpIGRvxZt3aWFkY3plbmlh
IGtvcnp5c3RhIGp1xbwgcG9uYWQgNDkgdHlzLiBLbGllbnTDs3cuIE1vbml0b3J1amVteSA4MDkg
MDAwIHBvamF6ZMOzdyBuYSBjYcWCeW0gxZt3aWVjaWUsIGNvIGplc3QgbmFzesSFIG5hamxlcHN6
xIUgd2l6eXTDs3drxIUuCgpCYXJkem8gcHJvc3rEmSBvIGUtbWFpbGEgendyb3RuZWdvLCBqZcWb
bGkgbW9nbGliecWbbXkgd3Nww7NsbmllIG9tw7N3acSHIHBvdGVuY2phxYIgd3lrb3J6eXN0YW5p
YSB0YWtpZWdvIHJvendpxIV6YW5pYSB3IFBhxYRzdHdhIGZpcm1pZS4KCgpQb3pkcmF3aWFtCkth
cm9sIE1pY2h1bgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtc25wcy1hcmMgbWFpbGluZyBsaXN0CmxpbnV4LXNucHMtYXJjQGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1zbnBzLWFyYwo=
