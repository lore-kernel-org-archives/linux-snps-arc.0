Return-Path: <SRS0=7Buk=AG=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E543C433E1
	for <linux-snps-arc@archiver.kernel.org>; Thu, 25 Jun 2020 01:46:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1BDC12077D
	for <linux-snps-arc@archiver.kernel.org>; Thu, 25 Jun 2020 01:46:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cdFC1gsz";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="YIxezxyM";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="N4f5Q7b6";
	dkim=neutral (0-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="A0EU2HQ8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1BDC12077D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:Message-ID:Date:Subject:To:
	From:Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WA706mFmIMChPm7pjcaVxiC4pV2/K1pBrtCRWUx7ywY=; b=cdFC1gszhPkjrj4pxMZIT688x4
	wqTvkZE1w41kLppw9c5Is3VsqCbtCeQpKpuKxBlO0iVaD/4T7AWgDmXdpwas115QrJfnaKFeU77NA
	+JLj+bMRkwBBObu9DGBmjs7SHalqCE2hV4Z2jOq+da24cSi4lU7IIA9Dh622uMrn9w60mfmqIwO2k
	ML14OG/BL1kFrBZuRTWh6ucI/TAfS1HwEjtwfN5lZnDHijO+5Wb0NgG2ioCevpLtAKA/9UiU9gOcq
	q+8WKNMFwssvJzpBOtrSETWPeih976UNDVfU8l/71MTe4dZ309BD9YWoPRHew9dIignAw72Auoox6
	sIYGECVw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1joGy7-0000ka-L6; Thu, 25 Jun 2020 01:46:23 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1joGy5-0000j7-KO; Thu, 25 Jun 2020 01:46:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=MIME-Version:Content-Transfer-Encoding:
 Content-ID:Content-Type:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-Description:In-Reply-To:References;
 bh=5kbgrzht0BWN93W5d0ZgxfFzVP4vhwiMTjej5Gl12NU=; b=YIxezxyMLQ1ZZyO0xnm/mZAYHU
 lZivhNkElHpvziMw2lWqNP7sQqUTPai2OdXcqy7aCmTnUX+bQE2ozsFF3zgdsvoYCuboqef6ukhVI
 hrGmA/Xe4XJbQG6rOeZNtp1rujMuaWCykhT9FG1GFHbku3jp4ywxr94h0dYfnu5FrfVD/yXHSlK5s
 8eLaprBORJPd6Rhik+sBxV5R6lEDFtO1BtKuAygAlNXOZAjihXIs5sxwclv4Bq7nOskIDil14MEcJ
 KKoW2oQ54XUjpZ8DvBf3PKDkwgNMwtg8bHISNqysc7DdR4m/k1ZtJhE2dqSMkSe7BMKmevQrFyQ9O
 SOr36iUQ==;
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1joGy1-00005s-L4; Thu, 25 Jun 2020 01:46:20 +0000
Received: from mailhost.synopsys.com (sv2-mailhost1.synopsys.com
 [10.205.2.133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 45A3AC0084;
 Thu, 25 Jun 2020 01:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1593049570; bh=5kbgrzht0BWN93W5d0ZgxfFzVP4vhwiMTjej5Gl12NU=;
 h=From:To:CC:Subject:Date:From;
 b=N4f5Q7b6gesKWu9G5ChVRBYuKTOv875S67eJFBXRLe1OVTxfyWONge4NCC5koIWon
 7WIHRrB3c/sDKTq0V7frKtQtnNFr6PDAck4ZGEED6HUya9UN44DOwfGFw4CPDD3aGJ
 BgaXWPD+CliJaWJw6tLEvGv3ZbAjDa5ia76n/gOBLNAtM/SRChl9Q4RlzRwD/HOmkN
 HaUUJxKf4YQ6nTVQ9+WFrqDBqq7bC8o0xlfjaFS1G4P/Ey5a5GYVEL7/NYNlKSviWh
 dPU7BX0o762d5+m4yzN2xQLX0fIdLzK45hztHclbdZ2Sysr4KyepjP3HyGfcm2OZyQ
 f3G8Py9bBQkgg==
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com
 [10.202.1.139])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id CE5E6A0096;
 Thu, 25 Jun 2020 01:46:05 +0000 (UTC)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2172.outbound.protection.outlook.com [104.47.59.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id 782714013F;
 Thu, 25 Jun 2020 01:46:04 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=vgupta@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="A0EU2HQ8";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WEJDSMEcoSZLdbPJ1twTJ0bcoxzUk9jqc+WJvtRl+ZEvzu1lVF6aVyR3BpiG+SvsgbEgRjKZ1OzKSaVLStu2J2ZwTeHsEDJvk5WFS3B7NUkK71U/q9jDunTpaUfdGufCsl70JwUIUjPrz+Q+8xiv9sbkt8Pi8MA6fCVOaglWKfR5TdKUwqwc7NEsHKmPyFpQCRJw2tKS90qjzfPSBYs6R4CwmLJdmn+PEs+fZTYy1xulYBs04mtSUxG/wuFon6HE1O9jrRU7EVmiI1dvgLirqpoviceX/sJYBYJD6X4wmmnKCGpiGxPsa/TChlQoeWlyR8/o/fnW7VObwJXp6H/6CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5kbgrzht0BWN93W5d0ZgxfFzVP4vhwiMTjej5Gl12NU=;
 b=E7opNQcne83ta9r++ICPIHkPyom2ZJxYeyZWN1tc2q7RnDcq5Gm/F2+zI9nnl2Y3+OscmsjkU6dj2YZcJLFXrnA4DIIJANJ7zhcySHX58ro2ReLs+rROtMiLf2jr0qara9Y0kiI0Vv+vKrl0uKp75ot/t51VUCW+3u05eimWE46bwsxK0YK6iQCvADZQSZ5mV6iFMeegNNpWta8a1aiBjqWVchqBPF0+0v/Z6tySQpDRjB8hsHiKfvUGdA3ehd6d/uleDVSOHYuOWIVzBJo2Yb1s8ktLrCUxU0a2E8ba3I1jd2PqnOplua0B4CTwAkTppGKMbtwnor0bsxDyq+rH1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5kbgrzht0BWN93W5d0ZgxfFzVP4vhwiMTjej5Gl12NU=;
 b=A0EU2HQ8ojeEo5z+OfA818GkrZ4xV4eUl5c2ltYzu6olgqBZ45Lxl3PM6dI+HvQiUruaeL2UR86s6jI7z+g2xMn6bhexeb1C+B3LM1EHSZ/peYl8bAYAP6/MZWUe30gZtHRP38WH66AMrNCc7tqTE7twurFa6/L7EacDnCNVjD4=
Received: from BYAPR12MB3479.namprd12.prod.outlook.com (2603:10b6:a03:dc::26)
 by BY5PR12MB3828.namprd12.prod.outlook.com (2603:10b6:a03:1a4::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.23; Thu, 25 Jun
 2020 01:46:02 +0000
Received: from BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::3d4f:7ae8:8767:75a4]) by BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::3d4f:7ae8:8767:75a4%7]) with mapi id 15.20.3131.021; Thu, 25 Jun 2020
 01:46:02 +0000
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: David Woodhouse <dwmw2@infradead.org>, "mailman@lists.infradead.org"
 <mailman@lists.infradead.org>
Subject: Repost: linux-snps-arc list msgs truncated ?
Thread-Topic: Repost: linux-snps-arc list msgs truncated ?
Thread-Index: AQHWSpJhT6pzq/OUlke9bgg2llBFCQ==
Date: Thu, 25 Jun 2020 01:46:02 +0000
Message-ID: <ab3ccdd1-37c3-ffaa-542d-e1e0019009ed@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
authentication-results: lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=none action=none
 header.from=synopsys.com;
x-originating-ip: [73.222.250.45]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a88228be-8391-440d-c7fe-08d818a98491
x-ms-traffictypediagnostic: BY5PR12MB3828:
x-microsoft-antispam-prvs: <BY5PR12MB3828BAE676FD835241AF27CBB6920@BY5PR12MB3828.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0445A82F82
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HrRfK6hNi5jiUXrJ14K6pbRvhCr3+ashZ7Dk4yrJPCXnwbYI74DBUJ+HfZBHL9M5lFmgaNyyMJ8rlyKnCNYhQELpvx0aTNtuT6WMjinWDifH0g5uLJtBHAZA4vSNFFN20oB6T4FRIV61ve3dl3n9I0PUHDRWFZy8GHd30dW2S3TpIu4xu1XUEfP6x2lQIJ9djpZPQsI5fEX+1KCo1O9ddZYpjl2g/A9wxyo6Bl5190Fip7KRYkqMlcJwXqqJzJS6keRLzKG2aoV+H5ZXiw4hDDDK48BOvaix682cHPbxbrtlYJPlQvM3lBeWE74r4ygqjWexVOH2m1ddnHyF9+icbWE+1g0Tn/shruFYzn5ajQT7lhEldvs0XvzaTPsVHV83v5uvns3sjlzSgwACtoG5QUzyylzjlKoJrR4vAufCv7LsYjUCkOPMs6idcVUkcYIfR21ooGQVCpjI6hTJhCbPWw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3479.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(39860400002)(396003)(366004)(346002)(376002)(136003)(186003)(966005)(31686004)(6512007)(4326008)(6506007)(26005)(2906002)(316002)(36756003)(110136005)(478600001)(8936002)(6486002)(86362001)(8676002)(5660300002)(71200400001)(2616005)(31696002)(4744005)(76116006)(83380400001)(66946007)(66446008)(64756008)(66556008)(66476007)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: feWM6Dm/SExYTVRgU/fMAKhHM5QslO37B/Xx9RDe5XZE5VzHRShmFanz+WV1lndhta9rPLTG4/qFmrGNeT87ITnAjko2s3f53SMHQtXs+3j+ZY6m/rRd63RIRxTEJmBNLzoN/7YY/THh/ICzw5FmMGIf1YQSZVr9EUhgrvVkFKK0paw1yGmNPifjzrLPOFAlr47Bd7uFkGYezJJ+27s9/vx6ZltMH0+IaTuhRnNnNPbaGk14RQk0k50cIOw+yneRcLX7jYOaCTaGt+Ihr0B3QcCqEZ/Sk9kowq9Sz+umdz/bZVUWdO8nJsuzuOXk37MKQv+BfKa1GpEl9W16Thj5TH8ANZbA/TJkHuztatjBBZzI1FnwQrnlm8XOqSAtTvQqFWWbPyoVOs1X+qJsUMHbBe6H0S4+Tp4rDZirYOs6miEfeEW5l+7Zdiwg3ZMGBpVIVCe/dz1mZ7rH112GRSGz7D1zdooWnlXmnAIaj14GOmI=
x-ms-exchange-transport-forked: True
Content-ID: <2B5F5FB66ADB3141A7E7B4F097CB5C11@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a88228be-8391-440d-c7fe-08d818a98491
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2020 01:46:02.4202 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: blxiIxIou4/YaZfZmzS16T+IuW1AUtQ80BdijAq6w7sq6pM/QRCKfTkEfyiUygynJvq4y8KiNRKfpbYXCxNQFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB3828
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200625_024618_245347_BA79A3D7 
X-CRM114-Status: GOOD (  11.62  )
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
Cc: arcml <linux-snps-arc@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Hi,

I'm the moderator for linux-snps-arc.
Is there some database corruption or some such. The msgs for linux-snap-arc seem
to have been truncated. Please see the main page below where entries for June-2018
thru May 2020 are gone. This must be a recent breakage as things used to work up
until recently.

http://lists.infradead.org/pipermail/linux-snps-arc/

TIA,
-Vineet

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
