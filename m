Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E32AC678DC
	for <linux-snps-arc@archiver.kernel.org>; Fri, 18 Aug 2023 08:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZV/WBAX114N17JLdHiQY60nUTNUurdrP24PsFD4cphk=; b=BvNrzl4QW2Dnl9
	URVWNtqBgYMjIR1NbAtFnlnfHYlkZhxv2EzGS8+H8p5op4F0J9HvMWIpzPxGzUamYheZIgPECiTZx
	GlZ6Lgemu/HR3h6hozXPuJi4t7gERkg7bgT3IIFCbL9M67dhyIdulY0iyDrdUA8EsxqakcBgnz0dC
	WTCTldIMr23fxpJlQ2JTQne7Oeu8iLwDbeK9P+yXUtVkFm0q06MfviwN7QR3SZzhsbaUjwXxbVcgZ
	JwEf74fTSXSU0jHR18S+KGr9NjlbCNZ3Ha4qJFwCMoIbWYjgdCAGMi2g+MOGj33ihUseAXUC1CcEw
	CP2eJoV+RtOOvwVTjLMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWugi-007ysn-1X;
	Fri, 18 Aug 2023 08:18:32 +0000
Received: from mail.leachkin.pl ([217.61.97.203])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWuge-007yqv-16
	for linux-snps-arc@lists.infradead.org;
	Fri, 18 Aug 2023 08:18:30 +0000
Received: by mail.leachkin.pl (Postfix, from userid 1001)
	id E027484325; Fri, 18 Aug 2023 09:16:18 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leachkin.pl; s=mail;
	t=1692346590; bh=elHzctRz/z3PfTIhGYJKd0TeBTmca98Y+JNgX4gfsPI=;
	h=Date:From:To:Subject:From;
	b=TdtnIwoSRmfZbmKoFC/ziTclRi8KAGzqIGNhfdWwifCq3xYpYwnWuU7O2z1zVrk7u
	 cVzbO0HWGAtFAuas1QCzpgjfRjmrELy8dsvs/Td0qxZf2RQIigYsfE1Pxy3vMKgxtT
	 hunwiFt+LToRFYp/qwR4vzkZ+eXkkkFIu/279Y6njDdJbICKOykpY7jKC26r1blD34
	 hqMYYPodyHqngVSuWKiQRig5sEmfJ7VMTJBg4cibwM0Yi1sy2NHlTBOrVJHQuix892
	 1e0Kbdi2GWjkUcZOv2gapknl/9nOSjuQuI0d+q/XkS7hWH26+RIRexvXyWFJnoI/XD
	 xw31oXin1vDbw==
Received: by mail.leachkin.pl for <linux-snps-arc@lists.infradead.org>; Fri, 18 Aug 2023 08:15:51 GMT
Message-ID: <20230818074501-0.1.4u.cu5h.0.f7dsrkj1j1@leachkin.pl>
Date: Fri, 18 Aug 2023 08:15:51 GMT
From: "Jakub Lemczak" <jakub.lemczak@leachkin.pl>
To: <linux-snps-arc@lists.infradead.org>
Subject: =?UTF-8?Q?Pytanie_o_samoch=C3=B3d?=
X-Mailer: mail.leachkin.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230818_011828_511595_A8DAF77E 
X-CRM114-Status: UNSURE (   1.42  )
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

RHppZcWEIGRvYnJ5LAoKQ3p5IGludGVyZXN1amUgUGHFhHN0d2Egcm96d2nEhXphbmllIHVtb8W8
bGl3aWFqxIVjZSBtb25pdG9yb3dhbmllIHNhbW9jaG9kw7N3IGZpcm1vd3ljaCBvcmF6IG9wdHlt
YWxpemFjasSZIGtvc3p0w7N3IGljaCB1dHJ6eW1hbmlhPyAKCgpQb3pkcmF3aWFtLApKYWt1YiBM
ZW1jemFrCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1zbnBzLWFyYyBtYWlsaW5nIGxpc3QKbGludXgtc25wcy1hcmNAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXNu
cHMtYXJjCg==
