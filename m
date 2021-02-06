Return-Path: <SRS0=yP3P=HN=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EFE0C433E0
	for <linux-snps-arc@archiver.kernel.org>; Thu, 11 Feb 2021 17:51:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D091764DCE
	for <linux-snps-arc@archiver.kernel.org>; Thu, 11 Feb 2021 17:51:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D091764DCE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YOE8GFu7vGysN+2T/k9q8kb7id6kJPHRoqoEnl2p/8Y=; b=MET62KS9fP/8V6o/Bx8DWStXJa
	CPmmYEpZsbQ4rT0SnfOdbbgfvshMIq2otusXk/M49sIPxQy0swOcUDwJ89+fk3pSl+J4RtHC4axGh
	7qVI33ke2bIYODj8xYocyFvA8+ZmHCSutlRALpl3PFMQ6SGZrL3ZqvZKlNEmrd2iCndkiyLGhNgTT
	6s2+xFmFVOW2Z/01tnfWR7VECk4GOODpVewOrf18MKV91T5zg9H+ifDq5+R6BDM7pnCGVKO2OoAdH
	sq/7jQL3d4S/+mhgiicD0b6Iat6EQG4zX5DBPMFsBEHh84OCp0Xf3yG4HGFkg0RsiFQjGporWpC64
	EO7zIn7w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lAG7x-00077z-6a; Thu, 11 Feb 2021 17:51:41 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l8TDW-0006hZ-0Q
 for linux-snps-arc@merlin.infradead.org; Sat, 06 Feb 2021 19:26:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=MIME-Version:Content-Transfer-Encoding:
 Content-Type:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=ajVvgK4vLL1tLkziFJLtOXstWew3WPsGKQwlB34CRTQ=; b=ZEnxjg7/7BXzo4bpS4OiRJVIQJ
 KktJ+xyF6zCebHzx+SDaw0v/FTo51RlX1DSgrd9OO2eSHC9n9EqCl9XlPfmL7Pf0k6Fw4EJZCwmwm
 fGXRMKVjhKLmA3wFa1BRL5mTdIf59Mhc7Ls948Da24yZB56JGibK20wQqxY6XMoiYL4NkV0rgoztT
 Ra5hL/XhsQJ7c9qd//mwGx2+tNYOQUxtk/UvynGYFEayzGFXIW3r4O7OsclaA3vvmZftJZ2/Pw2Og
 MDNYjKBHCBbm7lc0nm7AGYqQrBckyNVYrhUXSelKqXHXsKMZ2fLYtnsFEzNmOErN+tEEMklZCflKt
 Kvf4xOdg==;
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1l8TDT-003wke-Ok
 for linux-snps-arc@lists.infradead.org; Sat, 06 Feb 2021 19:26:00 +0000
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com
 [10.205.2.134])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id CD328C00EC;
 Sat,  6 Feb 2021 19:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1612639543; bh=ajVvgK4vLL1tLkziFJLtOXstWew3WPsGKQwlB34CRTQ=;
 h=From:To:CC:Subject:Date:From;
 b=AFk6GHgmXn4RWPuKQ+OLziFYwf8fNQqa0WCoVLtWNwn+r+k4Wx1fuRjGJg63J/sO7
 Zk9yixZ63Zlsx38hAFcrm/HR9EdcpwbYmuzg/TsRgtbNVZpEW02VSGUv5lNgRvNoDn
 NvYaJrrmNHtg15DHPnK64FMU7Ttrzzu4MULAevQTHOVq9dbkIzi+bQ69+dfprZmHhP
 R2iW6SBI3nBXHKfOcYNBxmdaJOgPbdbr3zty8htSQ1qjvahtT3cPyNPcbEhotHxYRg
 564fJOnGK+xFv8aSBSjPcGYVgOvPXERNLXgAwhSTudhE/IZ/WNXhWqY1yC0vWXfyXs
 ikyZJ8VtQh3wA==
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com
 [10.4.161.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 2C6EBA0096;
 Sat,  6 Feb 2021 19:25:40 +0000 (UTC)
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2172.outbound.protection.outlook.com [104.47.57.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id 3166680214;
 Sat,  6 Feb 2021 19:25:38 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=abrodkin@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="CuHrySI8";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iHMz2AjwfSA/IBAvHbZAys/Xm1mgng722meTaOY8b9xqorUvb+SdxOvL/nxDv8bxh+ZiJ0OxgOsy1OZe5PDIkweml/Fo48SAfhIV4Qt4zZU8rD8/UZ2/Jd/W5jQaHr6q+1etiKnqMCRIN7s+MnmJnz3IysVLU1miBlKcZ2TmE3zlHjoxTjocXmvebeTUlOAGFzWFDcmTKtp2dhPTDBaDSqGI0dCm6ioyUAKPf3x0VhNFC3chbI6dFYhQ75CpnzjGNmJcrQ5wRuXlpO7mSUb4VjEi9PQz3LwG7tpvvTNXLKJOiYaxDk6JkBmtpM2dJ+M/xSkSxK23clRL2TRiMzahbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ajVvgK4vLL1tLkziFJLtOXstWew3WPsGKQwlB34CRTQ=;
 b=UcHd2FRaiv4EI2RuGENg/7OQF8KMvasfY1cHNH0V5dPpQJpVYE2YsPSojFPlzgvYXtXZZeo8OC0FTfzs6x9KjEdgVWL/Q1v/24V48OmTv1qu3gZmlBmfKhk9tome1fnuKKc6vIBUm5q1tW35o4MB//wkCMEx+BdBdg8oU5z3fBmJOv9FJx+09pObTzgBKH7mNl0MSDTut1FRYd3TfHwTpKvxk7KjzJ0g6VQVd2umxxPRzEJzLZNh+AcE3FW7ITO0ryy+l8+T2lyyz8ALpjqSGITKx5GHm7rez1xGo0YXrm80cgTWMFj5nrEFDiWDdjiluFOjOBeymRTQxZCIWq1TfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ajVvgK4vLL1tLkziFJLtOXstWew3WPsGKQwlB34CRTQ=;
 b=CuHrySI8+KSkj5dXXVyGcVoGpeVJ5+uS/JH5BW+f7qg5OPsnvw20m0MtHO58KerKfOg0wUWEqUAji+oGaqfJG0QpLxMNvnPh/RHRGmr5ahRJNVdc/o5G2PO0a8sPq6cN+hTF8rvFx9/MWp5J2PGPrxdYmcn2HEMyi8pS/CR6cYQ=
Received: from BN8PR12MB3330.namprd12.prod.outlook.com (2603:10b6:408:43::15)
 by BN8PR12MB3075.namprd12.prod.outlook.com (2603:10b6:408:67::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.19; Sat, 6 Feb
 2021 19:25:35 +0000
Received: from BN8PR12MB3330.namprd12.prod.outlook.com
 ([fe80::9d50:a68f:f9cd:44b3]) by BN8PR12MB3330.namprd12.prod.outlook.com
 ([fe80::9d50:a68f:f9cd:44b3%6]) with mapi id 15.20.3825.030; Sat, 6 Feb 2021
 19:25:35 +0000
X-SNPS-Relay: synopsys.com
From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
To: "980963@bugs.debian.org" <980963@bugs.debian.org>
Subject: RE: dpkg: Please add ARC architecture
Thread-Topic: dpkg: Please add ARC architecture
Thread-Index: AQHW/L0p4qdbh/AU1k6vjN0gzHQfSw==
Date: Sat, 6 Feb 2021 19:25:35 +0000
Message-ID: <BN8PR12MB333028A46C2A7A80690DDB76A1B19@BN8PR12MB3330.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: bugs.debian.org; dkim=none (message not signed)
 header.d=none;bugs.debian.org; dmarc=none action=none
 header.from=synopsys.com;
x-originating-ip: [91.237.150.126]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 44f1da8b-1e39-4ec5-7a66-08d8cad4fa50
x-ms-traffictypediagnostic: BN8PR12MB3075:
x-microsoft-antispam-prvs: <BN8PR12MB3075014C01C22A632417231EA1B19@BN8PR12MB3075.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2887;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: j5C1ec1OCM6NzQWR7JOEByei4oFzCNRXlCCdgBF1t+1h2h8sVeiqzDrQWy0319L6kvBsI2jz8O6qEUSP1JufrYPzj0i8dW7Tj2P+M/N/PRcxfVkvEAhKmlIKZjlaxQ1e6VQ965t1VexReJrJr3tp25nHaSjNh7OWSaX9xgL7PbMHAE+jyxZi+gOJV2U3W7dnr8WuE/UU+k2SkXaeIGwKKvh7zLKa/v5AAZBAXqaQPm1sILJOGUuWuw7oEgmCFuCt9DQCLyBBvpakLSbEygn4AQGGQ26pzwMVzNKy2dlPDq+px4tZVtubwQ0bbQvWxZ2sa0CgPGsUQFk7js+cviFuvja85aVILYShFQXONuDCJEDaMrPKRE+ARIrjAKxwwW8SZ4+xRJCvSYuwHC/CBfPM4NDB5oW/S/zFfHqzESd3U7pI4Luii+4WlT691tB0ku4+aIfTKXejrIDKhx6h85TEDo3yGEOqkkpuTzw//W0xV2e2vVtW4VzXJ1xrj6DSHEGHJy6elCuzPq6kTv5Z4h+hJg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3330.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(136003)(376002)(366004)(396003)(39850400004)(6506007)(4270600006)(86362001)(33656002)(186003)(8676002)(26005)(6916009)(316002)(71200400001)(54906003)(7696005)(66446008)(55016002)(9686003)(64756008)(91956017)(83380400001)(4326008)(558084003)(76116006)(52536014)(2906002)(66946007)(5660300002)(8936002)(66556008)(66476007)(478600001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?iso-8859-1?Q?iq7BEMmUvHmFsXKQmHV1bjIn1xsZFnVP0A44o770lwLa1qYpFN3a9vA0RY?=
 =?iso-8859-1?Q?thqjamkEU5V9OSx3kPRVYZoNrDx8mbIibKCvJAJ3IvmsHz8Ep787img2VS?=
 =?iso-8859-1?Q?gA4ubn6F6aeUo1n/AQEoN/uHI+PX+XAjdJ4pcukaOAuz2srR1XqCXj/I/5?=
 =?iso-8859-1?Q?rS3K23mFqxoGFCybiCfBgkBfx+JbLc5eHQW3JHX6bJBUKsfKtBS95gj76U?=
 =?iso-8859-1?Q?X9hswr3Wol2oHP+0j/pClKBPBHC5nz9+aA7eg90/jiWbR1WNgBG+XtbNJE?=
 =?iso-8859-1?Q?+w1hXBXiw7wDVyrzoSxdh0QhQvVzaJ7Z7dtRRD3CVVHV5fTKZ5syaCg643?=
 =?iso-8859-1?Q?PZIAjDt8B6zym7gsAc6barh2si+lP6E+HRKye++XaxvgBrP5MMEZ8uATiY?=
 =?iso-8859-1?Q?XAfmfdVr0DEq3bu5YjwhI2B9ktl7QTesH+3a9CEixZjr26KBqpwsItSY8e?=
 =?iso-8859-1?Q?TK03yq0c76/fVNwsmoMZiMdTbIJUkMgeYK8cyPUxH/jgDCIBW4RWEYOZ6F?=
 =?iso-8859-1?Q?esRt93hLYZs+beYdEXH7MPnVfPdnCuHbhODxcH+JgXwgwaB9o+SwcSXJ2h?=
 =?iso-8859-1?Q?iJ3kc1gfkB2Rs9Eaw+JVfsVsua/ZcDmX/Whz1mtA5zW5GWLvRQVu3oQm5j?=
 =?iso-8859-1?Q?VfdfoBa+mC8Dt/VGrCjp9o4UraV5+18Hpl4JaiH0VnVkeYDWs2g1ty4SOS?=
 =?iso-8859-1?Q?sh5irUkAMkefJCkiCVXgT6R1UFCFnUdlaaN36HilMMkaLph5veqH84uWvW?=
 =?iso-8859-1?Q?8/U7V3yetO3Mk+ghultUTj6pp/hr1bsFIj/GQaa2c1FgqgGubgzqZXNazn?=
 =?iso-8859-1?Q?yY8E8DWwFdUhTuDRLhOL8mADZvCMQUvB/5vUguLeiveh1EhCI1CYeiB+rN?=
 =?iso-8859-1?Q?q74BnJ/EaS3V2N6V+aAOutcbQQGYLasJvT5lgvHzmhx795vWCCnnHksdPn?=
 =?iso-8859-1?Q?PDLvLke0wRrtXd8Z0SRDWC4M27fF2AKR0E1k7ZZ6Yjks/k+OoSsPfs3U9d?=
 =?iso-8859-1?Q?nAZgVwPboXlKErH3ZQnpkThHTEdsxnqv/1DWlqngQu/VY3AgLa2VDiijcZ?=
 =?iso-8859-1?Q?F7TmvyfMYFQIcXBhXv5LXvoqxPQ1IehvshhYJQmqxY2iYbNoFCVgfAd67q?=
 =?iso-8859-1?Q?7dgQO1XKjf7u6Z1aYYnTI3AZDUSKo7tNkUApXU8EBidZmpLni6Hr2Ijsxo?=
 =?iso-8859-1?Q?3NHCrKAB/6YyPNoCYK4bDv+eoJsWdIF5EmLgl9o+dCFITvi4/Yd8lHs4Ur?=
 =?iso-8859-1?Q?CUM6tgNicdk8k0jUzGM9kSB+MvF4OacUrMsSyVCqvPYcvpMTADSXhRQ1Qu?=
 =?iso-8859-1?Q?1FMurG7uBxnUZRCfSlQcZPgEwLFNHBjESCdISTAa471LZVruzgzWW7iKgO?=
 =?iso-8859-1?Q?7xctBW7+Iq?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3330.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44f1da8b-1e39-4ec5-7a66-08d8cad4fa50
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Feb 2021 19:25:35.2581 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AIWgbpMVY8XBLMoLQ9YFcMp+16MRcKVxKoehMiOrr31/YGRsnnps/j/ztn1GF4Nb3aVs57wQf/a8kAiC8TZXZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3075
X-Bad-Reply: 'Re:' in Subject but no References or In-Reply-To headers
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210206_192600_436648_025BD1D8 
X-CRM114-Status: UNSURE (   5.22  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Thu, 11 Feb 2021 12:51:38 -0500
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
Cc: linux-snps-arc <linux-snps-arc@lists.infradead.org>,
 Guillem Jover <guillem@debian.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Hello,

Any chances to get updates on this one some time soon?

Regards,
Alexey
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
