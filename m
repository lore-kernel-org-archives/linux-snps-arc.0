Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E241C83013
	for <linux-snps-arc@archiver.kernel.org>; Wed,  2 Jul 2025 08:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Jo5iin0caJAv3vTQvqoy3LNvmUzjq/N37CtcqLh3s80=; b=RQExaTj7KXqUMR
	BXxiESZisEUh+0HBEGfJeGG9nt9CAdaOHaHJHbQnVbHaEusx9r3y4fqkiY6HDRAZTkubhGPET8B10
	HaGqgXhZvl8dDGU6bqBYd7FSjlaFBYpPRWtWyaTKMfjzZUW+/6vbwmg05heDjaQm6NKZbyJyaF4/l
	EfY84qyZGuuhp15O5dusiiwUZmNhybXq6UK7DgZABNM+UhYa5PA8vHJoOTUTwV+zBat+sIoxdQM23
	9LQsFO3UqNlLVZjY0p0wVQtiXti5HmJ7QmzGdQauY87KcfFD2wIEsEW5+lfzf2FV420SFfgDo3H/8
	0i+EVWuss1ayTNNaxEhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWseM-00000007ako-39iQ;
	Wed, 02 Jul 2025 08:17:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWseL-00000007akd-2oos
	for linux-snps-arc@bombadil.infradead.org;
	Wed, 02 Jul 2025 08:17:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Subject:To:From:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=Q6Mp/vCJCiZNgk6fb7utkqIErbcoVoR/CugPofoeCtU=; b=Yah5kZXaksn4g6p5qohgMchyKA
	iSF9WHxTogK1z520g9yhZT+RR0A1izxiReUTJlQua6ztTPVTw6FoghGryFB9VRZ0xLQTeXlcYq/Xk
	o84YzVQzNryuFZ4DOiLNNTP5LnEyu0byl3zLICIiXAV1tkru5O9FzBd/ivKQVWbdTtEw4C/yrX05O
	nrJBGh+mPCW7r6zVlIwuZBAHTK9RW+WWttO5SaudnIZzerY/HhFsAcVa6kUP6b5UO7jh5NXauwSHT
	rcYNJg8ifA3MYpCaatcdpRBArujUtn+cYGpiAN8G4YX27l7iIVwFtIuHs7dWpsWugUCRxNf4OJUkn
	b4kLf/Zg==;
Received: from mail.successa.pl ([162.19.205.12])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWseH-00000007JKw-3aCF
	for linux-snps-arc@lists.infradead.org;
	Wed, 02 Jul 2025 08:17:00 +0000
Received: by mail.successa.pl (Postfix, from userid 1002)
	id 926E528378; Wed,  2 Jul 2025 10:16:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=successa.pl; s=mail;
	t=1751444213; bh=Q6Mp/vCJCiZNgk6fb7utkqIErbcoVoR/CugPofoeCtU=;
	h=Date:From:To:Subject:From;
	b=iNUFSgFGkSPBEs7+1bWrYXF528MZqcgdXX5lCgl6VUkAYlGxsI5BloLn5XuFK7atw
	 N3A68Mflzn+x6A1wWriDyHN9hcaAXSdUmV/3OS/3wEQL92msg7HBrURKI4/PO5UYPQ
	 /dHknSqgHzLBG+LvpcxQFwrkm3X7fRRQuOztYG5kgSg3g4Rihic+NRFSK2CHnJjv49
	 APZqskJ20L4hx3B4hixD0rtZFh4m3TCvZnG01zscdkELeftIC4ojSRKi32CGBVqkaD
	 atLG7tgHSSPJaB68lkp0BbJildQoEbcrZgFEZebA2NwlPKyrxub8Xrep4zuCOjnBNq
	 CMFiyFb7ZTXgA==
Received: by mail.successa.pl for <linux-snps-arc@lists.infradead.org>; Wed,  2 Jul 2025 08:16:09 GMT
Message-ID: <20250702084501-0.1.j4.20n8o.0.pad2z17vp3@successa.pl>
Date: Wed,  2 Jul 2025 08:16:09 GMT
From: "Adam Drzewiecki" <adam.drzewiecki@successa.pl>
To: <linux-snps-arc@lists.infradead.org>
Subject: =?UTF-8?Q?Pytanie_o_samoch=C3=B3d_?=
X-Mailer: mail.successa.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_091658_453991_9E0B3155 
X-CRM114-Status: UNSURE (   0.93  )
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
YWxpemFjasSZIGtvc3p0w7N3IGljaCB1dHJ6eW1hbmlhPyAKCgpQb3pkcmF3aWFtCkFkYW0gRHJ6
ZXdpZWNraQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtc25wcy1hcmMgbWFpbGluZyBsaXN0CmxpbnV4LXNucHMtYXJjQGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1z
bnBzLWFyYwo=
